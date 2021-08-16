package linksharing
import linksharing.Enums.VisibilityEnum


class Topic {

    String topicName;
    Date dateCreated;
    Date lastUpdated;
    VisibilityEnum visibility;


    static belongsTo = [createdBy: User];
    static hasMany = [subscribers: Subscription, resources: Resource] ;


    static constraints = {
        createdBy(nullable:false);
        topicName(nullable: false);

    }
    static mapping = {
        resources fetch: 'join';
        subscribers fetch: 'join';

        createdBy fetch: 'join';

//        subscribers cascade: 'all-delete-orphan'
//        resources cascade: 'all-delete-orphan'
    }
}
