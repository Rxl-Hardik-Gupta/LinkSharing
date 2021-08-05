package linksharing

class DashboardController {

    def DashboardService ;



    def index() {
        render(view: '../Dashboard/index');
    }

    def createShareLink() {
        DashboardService.addLinkToTopic(request.session, params) ;
        render LinkResource.list() ;
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
}
