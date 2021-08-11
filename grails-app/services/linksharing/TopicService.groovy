package linksharing

import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap
import linksharing.Enums.SeriousnessEnum
import linksharing.Enums.VisibilityEnum

import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpSession

@Transactional
class TopicService {

    def serviceMethod() {

    }



    Topic createTopic(HttpServletRequest  request, GrailsParameterMap params) {
        HttpSession session = request.session;
        User creator = session.getAttribute('user') as User ;
        creator = User.get(creator.id) ;
        Set<Topic> topicsSet = creator.topics ;
        for(Topic temp : topicsSet) {
            if(temp.topicName.equals(params.topicName)) return null;
        }
        Topic newTopic = new Topic(createdBy: creator, topicName: params.topicName) ;
        newTopic.visibility = params.visibility.toUpperCase() as VisibilityEnum ;

        Subscription sub = new Subscription(user:creator, topic:newTopic, seriousness: SeriousnessEnum.VERY_SERIOUS) ;
        creator.addToSubscriptions(sub)
        creator.addToSubscriptions(sub) ;
        newTopic.save() ;
        sub.save() ;

        session.setAttribute('user', creator) ;
        return newTopic ;
    }


//    def deleteTopic(HttpServletRequest request, GrailsParameterMap params) {
//        User u = request.session.getAttribute('user') as User ;
//        User user = User.get(u.id);
//        println request.parameterMap.topicId +" " +"Topic IDDDDDDDDDDDDDDDDDDDDDDDDDdd" ;
//        Topic topic = Topic.get(request.parameterMap.topicId ) ;
////        Subscription.deleteAll(topic.subscribers) ;
//        user.removeFromTopics(topic) ;
//        Set<Subscription> set = topic.subscribers ;
//        set.each {
//            Subscription sub = it;
//            sub.delete(flush:true) ;
//        }
////        Subscription.deleteAll(set) ;
//        Resource.deleteAll(topic.resources) ;
//        topic.delete(flush:true) ;
//
////        user.save() ;
//        request.session.setAttribute('user', user) ;
//
//    }
}
