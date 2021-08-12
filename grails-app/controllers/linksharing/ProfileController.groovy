package linksharing

import org.springframework.web.multipart.MultipartFile

class ProfileController {

    def index() {
        render(view: 'EditProfile') ;
    }


    def updateProfile() {
        User loggedInUser = User.get((request.session.getAttribute('user') as User).id) ;
        loggedInUser.firstName = params.firstName ;
        loggedInUser.lastName = params.lastName;
        loggedInUser.userName = params.userName ;

        MultipartFile uploadedFile = request.getFile('photoPath');
        Map map = ['message': null as String, 'exception': null as String] ;

        if(uploadedFile && !uploadedFile.empty){
            File photo = new File("/home/rxlogix/LinkSharing/grails-app/assets/images/ProfilePhoto/${params.userName}.png");
            uploadedFile.transferTo(photo) ;
            loggedInUser.photoPath= "/${params.userName}.png" ;

        }
        loggedInUser.save(flush: true) ;
        request.session.setAttribute('user', loggedInUser) ;
        redirect(controller:'dashboard') ;
    }



    def updatePassword() {
        User loggedInUser = User.get((request.session.getAttribute('user') as User).id) ;
        loggedInUser.password = params.password ;
        loggedInUser.save(flush:true) ;
        request.session.setAttribute('user', loggedInUser) ;
        redirect(controller: 'dashboard') ;
    }
}
