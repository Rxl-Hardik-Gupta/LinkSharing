package linksharing
import linksharing.Enums.SeriousnessEnum ;
class Subscription {

//    Topic topic;
//    User user;

    Date dateCreated;
    SeriousnessEnum seriousness;

    static belongsTo = [user: User, topic: Topic];

    static constraints = {


    }
    static mapping = {
        user fetch: 'join'
        topic fetch: 'join'
    }
}
