package linksharing

import org.grails.gsp.GroovyPagesException
import org.hibernate.Session
import org.hibernate.validator.constraints.Email

import javax.servlet.http.HttpSession

class AfterLoginController {

    def index() { }



//    def logout() {
//        request.getHeader('user')  ;
//        session.invalidate() ;
//        render('view':'../index') ;
//
//    }


    def logout(){

            HttpSession current = request.getSession();
            if (current != null) try {
                current.invalidate();
                render('view':'../index') ;

            } catch (IllegalStateException ignored) {
                // ok: session is already invalidated

                render('view': '../index');
            }
    }

}
