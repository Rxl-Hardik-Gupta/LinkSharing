package linksharing

import org.grails.gsp.GroovyPagesException
import org.hibernate.Session
import org.hibernate.validator.constraints.Email

import javax.servlet.http.HttpSession

class AfterLoginController {

//    def index() {
//        render(view: '../index') ;
//    }


    @Override
    String toString() {
        return super.toString()
    }

    def logout(){

            HttpSession current = request.getSession();
            if (current != null) try {
                current.invalidate();
                current.getAttribute('user') == null ;

            } catch (IllegalStateException ignored) {
                // ok: session is already invalidated

            } finally{
                redirect(controller: 'index' );
            }
    }

}
