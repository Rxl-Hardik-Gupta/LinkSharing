package linksharing

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class UserController {





    def showUsers(){
        List<User> users = User.all;

        render(view:'show', model: [users:users]);

    }
    def changeValidity() {
        User user = User.get(params.userID as long) ;
        if(params.val.equals('true')) user.active = true ;
        else user.active = false;
        user.save(flush:true) ;
        redirect(controller:'user', action:'showUsers') ;
    }

}
