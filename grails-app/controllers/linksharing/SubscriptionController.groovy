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
}
