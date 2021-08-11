package linksharing

class Resource {

    String description;
    Date dateCreated;
    Date lastUpdated;

    static belongsTo = [createdBy: User, topic: Topic] ;

    static constraints = {
    }

    static mapping = {

        table  'RTbl'
        createdBy fetch: 'join'
        topic fetch: 'join'
        tablePerHierarchy :true

    }
}
