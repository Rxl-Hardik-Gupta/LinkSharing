package linksharing

import linksharing.Enums.SeriousnessEnum

class SubscriptionController {

    def index() { }

    def changeSeriousness() {
        Subscription sub = Subscription.get(params.subId as String) ;
        println(sub.topic.toString() + " " + sub.user.toString() + " SUNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN") ;
        println(params.newSeriousness + "DDMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM") ;
        SeriousnessEnum newSer = params.newSeriousness as SeriousnessEnum ;
        println(newSer.toString() + "COmingSeriousnesssssssssssssssssss") ;
        sub.seriousness = (params.newSeriousness as String).toUpperCase() as SeriousnessEnum;
        sub.save(flush: true) ;
    }

    def acceptInvite() {
        User user = User.get(params.userId as long) ;
        if(session.getAttribute('user') != null && (session.getAttribute('user') as User).id.equals(user.id)) {
            Topic topic = Topic.get(params.id as long) ;
            Subscription sub = new Subscription(seriousness: 'VERY_SERIOUS', user: user, topic: topic) ;
            user.addToSubscriptions(sub) ;
            sub.save(flush:true) ;
            redirect(controller:'dashboard') ;
        }else redirect(controller: 'index') ;
    }
}
