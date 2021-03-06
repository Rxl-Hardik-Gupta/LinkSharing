package linksharing

import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap
import org.springframework.web.multipart.MultipartFile

import javax.servlet.http.HttpServletRequest

@Transactional
class IndexService {

    def serviceMethod() {

    }

    List<Topic> fetchTrending() {
        List<Topic>  topics = new ArrayList<>() ;
        topics = Topic.list() ;
        Collections.sort(topics,new Comparator<Topic>(){
            @Override
            public int compare( Topic t1,Topic  t2) {
                return  t2.resources.size() - t1.resources.size() ;
            }
        });
        return topics;

    }

    List<Resource> fetchLatestResources() {
        List<Resource> list = Resource.createCriteria().listDistinct {
            order("dateCreated", 'desc') ;
        }
        return list;
    }

    Map AuthenticateCredentials(GrailsParameterMap params) {

        String em = params.loginEmail ;
        String pswd = params.loginPassowrd;
        Map map = ['user' :null as User, 'message' : ""] ;
        User u = User.findByEmailOrUserName(em, em) ;
        if(u == null) {
            map.message = "User Does not Exist" ;
        }else if(!u.active) map.message = "User is Deactivated"
        else if(!u.password.equals(pswd))  {
            map.message = "Wrong Password" ;

        }

        else{
            map.user = u ;
        }
        return map;

    }

    Map createUser(HttpServletRequest request, GrailsParameterMap params) {

        MultipartFile uploadedFile = request.getFile('photoPath');
        Map map = ['message': null as String, 'exception': null as String];

        params.setProperty('active', true);
        if (uploadedFile && !uploadedFile.empty) {
            File photo = new File("/home/rxlogix/LinkSharing/grails-app/assets/images/ProfilePhoto/${params.userName}.png");
            uploadedFile.transferTo(photo);
            params.photoPath = "/${params.userName}.png";
        } else params.photoPath = "/ProflePhoto.jpg"
//        try {
            User u = new User(params);
            u.admin = true;
            u.validate() ;
            if(u.errors.hasFieldErrors('userName')) {
                map.exception = "A user with this username Already exists"
            }else if(u.errors.hasFieldErrors('email')) {
                map.exception = "A user with this email Already exists"
            }
            else{
                u.save(flush: true, failOnError: true);
                map.message = "User Registered Successfully";
            }
//        } catch{
//
//        }
        return map;
    }


}
