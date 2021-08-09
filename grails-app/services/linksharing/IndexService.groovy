package linksharing

import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap
import org.springframework.web.multipart.MultipartFile

import javax.servlet.http.HttpServletRequest

@Transactional
class IndexService {

    def serviceMethod() {

    }
    Map AuthenticateCredentials(GrailsParameterMap params) {

        String em = params.loginEmail ;
        String pswd = params.loginPassowrd;
        Map map = ['user' :null as User, 'message' : ""] ;
        User u = User.findByEmail(em) ;
        if(u == null) {
            map.message = "User Does not Exist" ;
        }
        else if(!u.password.equals(pswd))  {
            map.message = "Wrong Password" ;

        }else{
            map.user = u ;
        }
        return map;

    }

    Map createUser(HttpServletRequest request, GrailsParameterMap params) {

        MultipartFile uploadedFile = request.getFile('photoPath');
        Map map = ['message': null as String, 'exception': null as String] ;

        if(uploadedFile && !uploadedFile.empty){
            File photo = new File("/home/rxlogix/LinkSharing/grails-app/assets/images/ProfilePhoto/${params.userName}.png");
            uploadedFile.transferTo(photo) ;
            params.photoPath = "/${params.userName}.png" ;
        }else params.photoPath = "" ;
        try{
            User u = new User(params) ;
            u.save(flush: true, failOnError: true) ;
            map.message = "User Registered Successfully" ;
        }catch(Exception e) {
            map.exception = e.toString();
        }
        return map;
    }



}
