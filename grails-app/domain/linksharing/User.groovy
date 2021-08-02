package linksharing

import java.sql.Blob

class User {


    String email;
    String userName;
    String firstName;
    String lastName;
    String password;

    String photoPath;
    Boolean admin;
    Date dateCreated;
    Date lastUpdated;

    static hasMany = [topics      : Topic, subscriptions: Subscription, resuorces: Resource,
                      readingItems: ReadingItem, resourceRatings: ResourceRating];


    static constraints = {

        email(unique: true);
        userName(unique: true);
        firstName(blank: false, nullable: false);
        password(nullable: false, blank: false);
        photoPath(nullable: true, blank: true);

    }

    static mapping = {
        table name: "Usrtable"

//        tablePerHierarchy false
    }

}
