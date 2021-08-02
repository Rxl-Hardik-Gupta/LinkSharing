package linksharing

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class TopicController {


    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {


    }

    def createTopic (){
        User topicCreator = session.getAttribute('user') ;
        Topic newTopic = new Topic() ;


    }

}
