package linksharing

import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap
import org.springframework.web.multipart.MultipartFile

import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpSession

@Transactional
class DashboardService {

    def serviceMethod() {

    }

    def addLinkToTopic(HttpSession session, GrailsParameterMap params) {
        User loggedInUser = session.getAttribute('user') as User;
        Topic addLinkTo = Topic.get(params.topic) ;
        Resource newLink = new LinkResource(url: params.url, description: params.description, createdBy: loggedInUser, topic: addLinkTo);
        newLink.save(flush: true, failOnError: true);
        loggedInUser.resuorces.add(newLink) ;
        addLinkTo.resources.add(newLink) ;
        println addLinkTo.topicName ;
        addLinkTo.save(flush: true) ;
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
                loggedInUser.resuorces.add(documentResource) ;
                result.success = "Success" ;
            }
        }
        return result;
    }

    def unsubscribe(HttpServletRequest request, GrailsParameterMap params) {
        User loggedInUser = request.session.getAttribute('user') as User;

        Subscription sub = Subscription.get(request.parameterMap.subId )
        loggedInUser.subscriptions.remove(sub) ;
//        sub.delete() ;
    }




//    def fileUpload()
//    {
//        MultipartFile myFile = params.myfile
//        File file = new File("/home/rxlogix/newProject/Files/${myFile.originalFilename}")
//        myFile.transferTo(file)
//        String path = file.getAbsolutePath()
//        LinkUser u = session.getAttribute("user")
//        LinkUser u1 = LinkUser.get(u.id)
//        String t = params.get("topi")
//        Topic topic = Topic.findByName(t)
//        MainResource r = new DocumentRsource(description: params.get("document"),createdBy: u1,topic: topic,filePath: path)
//        r.validate()
//        if(r.hasErrors())
//        {
//            r.errors.allErrors.each {
//                println it
//            }
//        }
//        else{
//            r.save(flush:true,failOnError:true)
//            topic.addToResources(r)
//            topic.createdBy.addToResources(r)
//        }
//        session.setAttribute("user",u1)
//        redirect(controller:"dashboard",action:"dashboard")
//    }



//    MultipartFile uploadedFile = request.getFile('photoPath');
//    Map map = ['message': null as String, 'exception': null as String] ;
//
//    if(uploadedFile && !uploadedFile.empty){
//        File photo = new File("/home/rxlogix/LinkSharing/grails-app/assets/images/ProfilePhoto/${params.userName}.png");
//        uploadedFile.transferTo(photo) ;
//        params.photoPath = "/${params.userName}.png" ;
//    }
//    try{
//        User u = new User(params) ;
//        u.save(flush: true, failOnError: true) ;
//        map.message = "User Registered Successfully" ;
//    }catch(Exception e) {
//        map.exception = e.toString();
//    }
//    return map;

}
