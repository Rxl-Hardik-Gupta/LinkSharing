package linksharing

class ResourceRating {


//    Resource resource;
//    User user;


    Integer score;

    static belongsTo = [resource: Resource, user: User] ;

    static constraints = {
    }
    static mapping = {
        resource fetch: 'join' ;
        user fetch: 'join' ;
    }
}
