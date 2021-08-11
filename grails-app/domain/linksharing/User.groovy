package linksharing

import java.sql.Blob

class User {


    String email;
    String firstName;
    String lastName;
    String userName;
    String password;
    Date dateCreated;
    Date lastUpdated;
    Boolean admin;
    String photoPath;

    static hasMany = [topics      : Topic, subscriptions: Subscription, resources: Resource,
                      readingItems: ReadingItem, resourceRatings: ResourceRating];

    static constraints = {

        email(unique: true);
        userName(unique: true);
        firstName(blank: false, nullable: false);
        password(nullable: false, blank: false);
        admin nullable:true, bank: true;
        photoPath nullable: true, blank: true;

    }

    static mapping = {
        table  "UserTable"


        topics fetch: 'join'
        subscriptions fetch: 'join'
        resourceRatings fetch: 'join'
        resources fetch: 'join'
        readingItems fetch: 'join'

        topics cascade: 'all-delete-orphan'
        resources cascade: 'all-delete-orphan'
        readingItems cascade: 'all-delete-orphan'
        resourceRatings cascade: 'all-delete-orphan'
        subscriptions cascade: 'all-delete-orphan'
//        tablePerHierarchy false
    }

}
