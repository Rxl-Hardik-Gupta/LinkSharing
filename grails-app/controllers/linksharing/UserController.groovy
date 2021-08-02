package linksharing

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class UserController {


//    static scaffold = User;?\



    def showUsers(){


        render(view: 'show', model: [users: User.list()]);

    }

}
