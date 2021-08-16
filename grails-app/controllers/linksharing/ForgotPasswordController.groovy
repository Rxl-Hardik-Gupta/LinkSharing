package linksharing

class ForgotPasswordController {

    def index() {
        render(view: 'forgotPassowrd')
    }



    def fetchAccount() {
        String email =  params.email
        User user = User.findByEmail(email)
        if(!user) {
            flash.error = "No Such User Exists"
            redirect(controller:'forgotPassword')
        }else{
            Token token = Token.findByEmail(email)
            if(!token) {
                String val = UUID.randomUUID().toString().replaceAll('-', '')
                token = new Token(email: user.email,value: val)
                token.save(flush: true);
            }
            String link = "http://localhost:4001" + (createLink(controller: 'resetPassword', action: 'resetPasswordEmail',params:[name:user.userName,token:token.value]) as String)
            sendMail {
                to "${user.email}"
                subject "Hello ${user.firstName} Your password reset link is here!!!"
                text link
            }
            flash.emailSuccess = "Link to reset your password has been sent to your Email"
            redirect(controller: "index") ;
        }
    }


}
