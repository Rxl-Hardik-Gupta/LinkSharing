package linksharing

class ResourceController {

    def index() { }

    def markAsRead() {
        ReadingItem rd = ReadingItem.get(params.readingItem as Long) ;
        rd.isRead = true;
        rd.save(flush:true)
        redirect(controller:'dashboard') ;
    }

    def download() {
        DocumentResource rs = Resource.get(params.resId as long) ;
        File file = new File("${rs.filePath}") ;
        byte[] doc = file.getBytes() ;
        response.setContentType("application/octet-stream") ;
        response.setHeader("content-disposition", "attachment: filename=" + file.name) ;
        response.contentLength = doc.length ;
        response.outputStream << doc ;
        redirect(controller:'dashboard') ;
    }
}
