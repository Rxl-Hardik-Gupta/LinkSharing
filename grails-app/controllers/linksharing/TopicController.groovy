package linksharing

import grails.validation.ValidationException
import linksharing.Enums.SeriousnessEnum
import linksharing.Enums.VisibilityEnum

import static org.springframework.http.HttpStatus.*

class TopicController {
    def TopicService ;


    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {


    }



    def openTopic() {
//        println('PArams+++++++++++++++++++' + params) ;
//        println("ParamMap>>>>>>>>>>>>>>>>>"  + request.parameterMap.toString()) ;
        println(params.topicId as Integer) ;
        Topic t =  Topic.get(request.parameterMap.topicId );
        request.session.setAttribute('topic', t) ;
        render(view: '../topic/index') ;
     }

    def createTopic (){
        println "Controller is Called"
        Topic topic = TopicService.createTopic(request, params) ;
//        return topic;
//        if(topic != null) redirect(controller:"index", action:"dashboard") ;
////        else render(view: '../index');
//
////        else redirect(controller: 'dashboard', action:"index" ) ;
//        render(view:'../Dashboard/index')
        redirect(controller: 'dashboard') ;
    }

    def deleteTopic(){
        println "Delete topic called"
        Topic t = Topic.get(params.topicId as long)

        println t.id + "Topic IDd"
        def r = Resource.findAllByTopic(t)
        def subscriptions = Subscription.findAllByTopic(t)
        subscriptions.each {
            User usr = it.user ;
            usr.removeFromSubscriptions(it) ;
            usr.save()
        }
        User user = t.createdBy;
        println "User++++++++++" + user;
        user.removeFromTopics(t)
        user.save()

//        r.each {
//            def rItem = ReadingItem.findAllByResource(it)
//            rItem.each {t1 ->
//                if(t1 != null){
//                    t1.delete(flush: true)
//                }
//            }
////            def rRating = ResourceRating.findAllByResource(it)
////            rRating.each {r1->
////                if(r1!=null){
////                    r1.delete(flush:true)
////                }
////            }
////            if(LinkResource.findByResource(it)!=null){
////                def l = LinkResource.findByResource(it)
////                l.delete(flush:true)
////                it.delete(flush:true)
////            }else if (DocumentResource.findByResource(it)!=null){
////                def d = DocumentResource.findByResource(it)
////                d.delete(flush:true)
////                it.delete(flush:true)
////            }
//        }
//        Subscription.deleteAll(ri)
//        ri.each {
//            it.delete(flush:true)
//        }
        t.delete(flush:true)
        redirect(controller: "user", action: "userPage")
    }



//    def deleteTopic() {
////        TopicService.deleteTopic(request,params) ;
//        Topic topic = Topic.get(params.topicId as Long) ;
//        User user = session.getAttribute('user') as User;
//        User temp = User.get(user.id) ;
//        temp.removeFromTopics(topic) ;
//        List<Subscription> subs = Subscription.findAllByTopic(topic) ;
//        List<Resource> res = Resource.findAllByTopic(topic) ;
//        List<ResourceRating> ratings = new ArrayList<>() ;
//        for(Resource r : res) {
//            ratings.addAll(ResourceRating.findAllByResource(r)) ;
//        }
//        subs.collect().each {if(it) it.delete(flush:true)} ;
//        res.collect().each {if(it) it.delete(flush:true)} ;
//        ratings.collect().each {if(it) it.delete(flush:true)};
//        topic.resources.clear() ;
//        topic.subscribers.clear()
//        temp.save(flush:true) ;
//        topic.delete(flush:true) ;
//        session.setAttribute('user', temp) ;
//        redirect(controller: 'dashboard')
//
//    }
    def changeVisibility() {
        Topic topic = Topic.get(params.topicId as Long) ;
        VisibilityEnum newVisibility = params.newVisibility as VisibilityEnum ;
        topic.visibility = newVisibility ;
        topic.save(flush: true) ;
        redirect(controller: 'dashboard')
    }
    def unsubscribeTopic() {
        Topic topic = Topic.get(params.topicId as Long) ;
        User user = request.session.getAttribute('user') as User ;
        User temp = User.get(user.id) ;
        Subscription sub = Subscription.findByTopicAndUser(topic, user) ;
        topic.removeFromSubscribers(sub );
        temp.removeFromSubscriptions(sub) ;
        sub.delete(flush:true, failOnError:true) ;
        temp.save(flush: true) ;
        request.session.setAttribute('user', temp) ;
        redirect(controller:'dashboard');
//        temp.save() ;
    }
    def subscribe() {
        Topic topic = Topic.get(params.topicId as Long) ;
        User user = session.getAttribute('user') as User ;
        Subscription sub = new Subscription(user:user, topic:topic, seriousness: SeriousnessEnum.VERY_SERIOUS) ;
        user.addToSubscriptions(sub) ;
        topic.addToSubscribers(sub) ;
        topic.save(flush:true) ;
        sub.save(flush: true) ;
        redirect(controller:'dashboard');
    }

    @Override
    String toString() {
        return super.toString()
    }

    def sendInvite() {

        User user = User.findByEmail(params.email as String) ;
        if(!user) flash.inviteMessage = "The Email does not Correspond to Any User" ;
        else{
            Topic topic = Topic.get(params.topicId as long) ;
            String inviteLink = "http://localhost:4001" + (createLink(controller: 'subscription', action: 'acceptInvite', params: [id: topic.id, userId: (user.id).toString() ]) as String);
            flash.inviteMessage = "Invitation Sent" ;
            sendMail {
                to user.email
                subject "Invitation"
                text inviteLink
            }

        }



        redirect(controller:'dashboard') ;
    }



}
