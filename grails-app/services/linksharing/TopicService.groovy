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
        Set<Topic> topicsSet = creator.topics ;
        for(Topic temp : topicsSet) {
            if(temp.topicName.equals(params.topicName)) return null;
        }
        Topic newTopic = new Topic(createdBy: creator, topicName: params.topicName) ;
        newTopic.visibility = params.visibility.toUpperCase() as VisibilityEnum ;

        Subscription sub = new Subscription(user:creator, topic:newTopic, seriousness: SeriousnessEnum.VERY_SERIOUS) ;
        creator.topics.add(newTopic) ;
        creator.subscriptions.add(sub) ;
        newTopic.save() ;
        sub.save() ;
        return newTopic ;
    }
}
