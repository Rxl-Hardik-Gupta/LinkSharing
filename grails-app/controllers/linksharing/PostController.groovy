package linksharing

class PostController {

    def index() {
        println(params.postId + " This is params")
        Resource rs = Resource.get(params.postId as Long) ;
        println rs ;
        render(view: '../post/Post' , model: [res: rs]) ;
    }
}
