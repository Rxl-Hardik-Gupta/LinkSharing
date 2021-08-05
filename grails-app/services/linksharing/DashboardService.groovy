package linksharing

import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap

import javax.servlet.http.HttpSession

@Transactional
class DashboardService {

    def serviceMethod() {

    }

    def addLinkToTopic(HttpSession session, GrailsParameterMap params) {
        User loggedInUser = session.getAttribute('user') as User;
        Topic addLinkTo = Topic.get(params.topic) ;
        Resource newLink = new LinkResource(url: params.url, description: params.description, createdBy: loggedInUser, topic: addLinkTo);
        newLink.save(flush: true);
        loggedInUser.resuorces.add(newLink) ;
        addLinkTo.resources.add(newLink) ;
        addLinkTo.save(flush: true) ;
        println newLink;


    }
}
