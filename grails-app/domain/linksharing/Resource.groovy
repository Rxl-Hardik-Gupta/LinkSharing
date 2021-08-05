package linksharing

class Resource {

    String description;
    Date dateCreated;
    Date dateUpdated;

    static belongsTo = [createdBy: User, topic: Topic] ;

    static constraints = {
    }

    static mapping = {

        table 'RTbl'
        tablePerHierarchy :true

    }
}
