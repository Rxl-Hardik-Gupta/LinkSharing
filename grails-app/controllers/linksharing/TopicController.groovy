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
        return topic;
//        if(topic != null) redirect(controller:"index", action:"dashboard") ;
////        else render(view: '../index');
//
////        else redirect(controller: 'dashboard', action:"index" ) ;
//        render(view:'../Dashboard/index')
    }
    def deleteTopic() {
//        TopicService.deleteTopic(request,params) ;
        Topic topic = Topic.get(params.topicId as Long) ;
        User user = session.getAttribute('user') as User;
        topic.delete(flush:true) ;
        redirect(controller: 'dashboard')

    }
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


}
