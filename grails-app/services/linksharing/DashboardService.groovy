package linksharing

import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap
import org.springframework.web.multipart.MultipartFile

import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpSession
import java.lang.reflect.Parameter

@Transactional
class DashboardService {

    def serviceMethod() {

    }

    def fetchInbox(HttpServletRequest request) {
        List<ReadingItem> resourceList = new ArrayList<>() ;
        User user = request.session.getAttribute('user') as User ;
        for(ReadingItem rd : ReadingItem.all) {
            println(rd.class);
            if(!rd.isRead) resourceList.add(rd) ;
        }
        request.session.setAttribute('inbox', resourceList) ;

    }
    def fetchTrending(HttpServletRequest request) {
        HashSet<Topic> topics = Topic.list().toSet() ;
        List<Topic> topic =  topics.sort {it.resources.size()}.reverse().toList() ;

//        List<Topic>  topics = Topic.createCriteria().listDistinct {
//            order('resources', 'desc') ;
//        } ;
//        Map map = [temp: topics] ;
//        map.sort {it.value.size()} ;
//        Collections.sort(topics,new Comparator<Topic>(){
//            @Override
//            public int compare( Topic t1,Topic  t2) {
//                return  t2.resources.size() - t1.resources.size() ;
//            }
//        });

        request.session.setAttribute('trending', topics) ;
    }

    def addLinkToTopic(HttpSession session, GrailsParameterMap params) {
        User loggedInUser = session.getAttribute('user') as User;
        User temp = User.get(loggedInUser.id) ;
        Topic addLinkTo = Topic.get(params.topic) ;
        Resource newLink = new LinkResource(url: params.url, description: params.description, createdBy: loggedInUser, topic: addLinkTo);
        ReadingItem rd = new ReadingItem(resource: newLink, user: temp, isRead: false);

        newLink.save(flush: true, failOnError: true);
//        loggedInUser.resources.add(newLink) ;
        temp.getResources().add(newLink) ;
        temp.getReadingItems().add(rd) ;
        addLinkTo.resources.add(newLink) ;
        println addLinkTo.topicName ;
        addLinkTo.save(flush: true) ;
        temp.save() ;
        rd.save() ;
        session.setAttribute('user', temp) ;
        println newLink;
    }

    Map uploadDocument(HttpServletRequest request, GrailsParameterMap params) {
        Map result = [errors: null as List<Error>, success: null as String ] ;
        HttpSession session = request.session ;
        User loggedInUser = session.getAttribute('user') as User;
        Topic topic = Topic.get(params.topic as Integer) ;
        MultipartFile uploadedDoc = request.getFile('document') ;
        if(uploadedDoc && !uploadedDoc.isEmpty()) {
            File doc = new File("/home/rxlogix/LinkSharing/grails-app/assets/TopicResources/${uploadedDoc.originalFilename}")
            uploadedDoc.transferTo(doc) ;
            String filePath = doc.getAbsolutePath() ;
            Resource documentResource = new DocumentResource(description: params.documentDescription, createdBy: loggedInUser,filePath: filePath, topic: topic);
            ReadingItem rd = new ReadingItem(resource: documentResource, user: loggedInUser, isRead: false) ;
            documentResource.validate() ;
            if(documentResource.hasErrors()) {
                result.errors = new ArrayList<>() ;
                documentResource.errors.allErrors.each {
                    println it;
                    result.errors.add(it) ;
                }
            }else{
                documentResource.save(flush: true, failOnError: true) ;
                topic.resources.add(documentResource) ;
                loggedInUser.resources.add(documentResource) ;
                result.success = "Success" ;
            }
            rd.save() ;
        }
        return result;
    }

    def unsubscribe(HttpServletRequest request, GrailsParameterMap params) {
        User loggedInUser = request.session.getAttribute('user') as User;
        User temp = User.get(loggedInUser.id) ;

        Subscription sub = Subscription.get(request.parameterMap.subId )
        Topic topic = Topic.get(sub.topic.id) ;
        temp.removeFromSubscriptions(sub) ;
        topic.removeFromSubscribers(sub) ;
        sub.delete(flush:true) ;
//        temp.save() ;
        request.session.setAttribute('user', temp) ;
    }

}
