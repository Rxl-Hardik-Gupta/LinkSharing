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

    static hasMany = [topics      : Topic, subscriptions: Subscription, resuorces: Resource,
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
        table name: "UserTable"
        topics fetch: 'join' ;
        subscriptions fetch: 'join'
        resuorces fetch: 'join'
        resourceRatings fetch: 'join'
        readingItems fetch: 'join'

//        tablePerHierarchy false
    }

}
