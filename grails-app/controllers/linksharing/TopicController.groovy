package linksharing

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class TopicController {
    def TopicService ;


    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {


    }

    def createTopic (){
        println "Controller is Called"
        Topic topic = TopicService.createTopic(request, params) ;
        if(topic != null) redirect(controller:"index", action:"dashboard") ;
//        else render(view: '../index');
        render( [a:"This"]) ;
    }

}
