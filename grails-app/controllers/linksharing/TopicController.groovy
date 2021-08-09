package linksharing

import grails.validation.ValidationException
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
        if(topic != null) redirect(controller:"index", action:"dashboard") ;
//        else render(view: '../index');
        render( [a:"This"]) ;
    }

}
