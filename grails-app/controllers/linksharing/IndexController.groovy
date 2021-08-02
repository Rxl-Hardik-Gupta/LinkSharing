package linksharing

import grails.web.servlet.mvc.GrailsHttpSession

import javax.servlet.http.HttpSession

class IndexController {
    def IndexService ;

    def index() { }




    def login(){

        Map map = IndexService.AuthenticateCredentials(params) ;
        if(!map.message.equals("")) {
            flash.message = map.message;
            render(view:'/index') ;
        }
        else {
            User u = map.user;
//            println("verybefore+++++++++++++++++++" +  session );
//
//            HttpSession session = request.session;
//            println("before+++++++++++++++++++" +  session );
            session.setAttribute('user', u) ;
            println("after+++++++++++++++++" + session)   ;
            render(view: '/Dashboard/index') ;
        }
    }


    def register() {

        Map map = IndexService.createUser(request, params) ;
        if(map.exception == null) flash.registerMessage = map.message ;
        else flash.error = map.exception;
        render('view':'../index');
    }

}
