package linksharing

class DashboardController {

    def DashboardService ;



    def index() {
        if(!session || session.getAttribute('user') == null) redirect(controller:'index') ;
        else{
            DashboardService.fetchInbox(request);
            DashboardService.fetchTrending(request) ;
            render(view: '../Dashboard/index');
        }
    }

    def createShareLink() {
        DashboardService.addLinkToTopic(request.session, params) ;
        redirect(controller: 'dashboard') ;
    }
    def shareDocument() {
        Map map = DashboardService.uploadDocument(request, params)  ;
        if(map.errors == null) {
            flash.message = "Document Added Successfully" ;
        }else {
           flash.message =  map.errors.toString() ;
        }
        redirect(controller:'dashboard') ;
    }

    def unsubscribe() {
        DashboardService.unsubscribe(request, params) ;
        redirect(view:'dashboard')
    }
}
