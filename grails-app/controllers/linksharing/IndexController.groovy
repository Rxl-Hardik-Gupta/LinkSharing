package linksharing


class IndexController {
    def IndexService ;

    def index() {



    }


    def dashboard() {
        render(view:'../Dashboard/index') ;
    }




    def login(){

        Map map = IndexService.AuthenticateCredentials(params) ;
        if(!map.message.equals("")) {
            flash.message = map.message;
            redirect(uri: '/') ;
        }
        else {
            User u = map.user;
            session.setAttribute('user', u) ;
            render(view: '/Dashboard/index') ;
        }
    }


    def register() {

        Map map = IndexService.createUser(request, params) ;
        println("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT" + " " +  request.getFile('photoPath')) ;
        if(map.exception == null) flash.registerMessage = map.message ;
        else flash.error = map.exception;
        println(map.exception) ;
        redirect(uri:'/');
    }



}
