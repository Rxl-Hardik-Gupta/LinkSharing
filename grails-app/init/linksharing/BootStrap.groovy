package linksharing

class BootStrap {

    def init = { servletContext ->
        createUser() ;
        createDummyTopics() ;
    }


    List<User> users;
    List<Topic> topics;


    def createUser(){

        User u1 = new User(email: 'h@g.c', firstName: 'Hardik', lastName: 'Gupta', userName: 'username', password: '1', admin: true, subscriptions: [], active: true) ;
        User u2 = new User(email: 'j@g.c', firstName: 'John', lastName: 'Oliver', userName: 'jo', password: '1', admin: true, subscriptions: [],active: true) ;
        User u3 = new User(email: 'a@g.c', firstName: 'Allan', lastName: 'Donald', userName: 'allan', password: '1', admin: true, subscriptions: [], active: true) ;
        User u4 = new User(email: 'ja@g.c', firstName: 'Jacob', lastName: 'Oram', userName: 'jacob', password: '1', admin: true, subscriptions: [],active: true) ;
       u1.save(flush:true) ;
       u2.save(flush:true) ;
       u3.save(flush:true) ;
       u4.save(flush:true) ;
        users = new ArrayList<>() ;
        users.add(u1);
        users.add(u2);
        users.add(u3);
        users.add(u4);

    }

//    String topicName;
//    Date dateCreated;
//    Date lastUpdated;
//    VisibilityEnum visibility;
//
//
//    static belongsTo = [createdBy: User];
//    static hasMany = [subscribers: Subscription, resources: Resource] ;



    //////////////////
//    Date dateCreated;
//    SeriousnessEnum seriousness;
//    static belongsTo = [user: User, topic: Topic];

    def createDummyTopics() {

        topics = new ArrayList<>() ;

        Topic t1 = new Topic(topicName: 'New Topic', visibility: 'PUBLIC', createdBy: users.get(0), subscribers: []) ;
        Topic t2 = new Topic(topicName: 'Topic U2', visibility: 'PUBLIC', createdBy: users.get(1), subscribers: []) ;
        Topic t3 = new Topic(topicName: 'Topic U3', visibility: 'PUBLIC', createdBy: users.get(2), subscribers: []) ;
        Topic t4 = new Topic(topicName: 'Topic U4', visibility: 'PUBLIC', createdBy: users.get(3), subscribers: []) ;
        topics.add(t1) ;
        topics.add(t2) ;
        topics.add(t3) ;
        topics.add(t4) ;
        t1.save(flush:true) ;
        t2.save(flush: true) ;
        t3.save(flush: true) ;
        t4.save(flush: true) ;
        for(Topic t  : topics) {
            for(User u : users) {
                Subscription s = new Subscription(seriousness: 'VERY_SERIOUS', user: u, topic:t) ;
                t.subscribers.add(s) ;
                u.subscriptions.add(s) ;
                s.save(flush: true) ;
                u.save(flush:true) ;
            }
        }


    }


    def destroy = {
    }
}
