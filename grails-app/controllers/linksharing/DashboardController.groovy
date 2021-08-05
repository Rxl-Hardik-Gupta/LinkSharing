package linksharing

class DashboardController {

    def DashboardService ;

    def index() { }

    def createShareLink() {
        DashboardService.addLinkToTopic(request.session, params) ;
        render LinkResource.list() ;
    }
}
