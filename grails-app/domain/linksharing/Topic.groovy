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
        subscribers fetch: 'join'
        resources fetch: 'join'
    }
}
