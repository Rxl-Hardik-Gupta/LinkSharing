package linksharing

class ResetPasswordController {

    def index() {
        render(view:'resetPassword') ;
    }


    def resetPasswordEmail() {

        String value = params.token
        def token =Token.findByValue(value)
        if(token) {
            String username = User.findByEmail(token.email).userName ;
//            println(token.email + "Email fomr token" + )
            if(username && username.equals(params.name as String)) {
                render(view: 'resetPassword', model: [name: params.name])
            }else redirect(controller:'index')
        }
        else{
            redirect(controller:'index')
        }

    }


    def resetPassword(){
        User user = User.findByUserName(params.userName as String) ;
        String newPassword = params.password as String ;
        user.password = newPassword;
        user.save(flush:true) ;
        flash.resetMessage = "Password changed Sucessfully" ;
        redirect(controller: 'index') ;
    }
}
