package linksharing

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class UserController {





    def showUsers(){

        if(!session || session.getAttribute('user') == null) redirect(controller:'index')
        else if(!(session.getAttribute('user') as User).admin) {
            flash.notAdmin = "You Are Not an Admin" ;
            redirect(controller:'dashboard') ;
        }
        else{
            List<User> users = User.all;

            render(view:'show', model: [users:users]);
        }

    }
    def changeValidity() {
        User user = User.get(params.userID as long) ;
        if(params.val.equals('true')) user.active = true ;
        else user.active = false;
        user.save(flush:true) ;
        redirect(controller:'user', action:'showUsers') ;
    }

}
