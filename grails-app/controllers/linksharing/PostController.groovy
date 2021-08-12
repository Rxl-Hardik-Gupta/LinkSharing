package linksharing

class PostController {

    def index() {
        println(params.postId + " This is params")
        Resource rs = Resource.get(params.postId as Long) ;
        println rs ;
        render(view: '../post/Post' , model: [res: rs]) ;
    }

    def ratePost() {
        User user = (session.getAttribute('user') as User) ;
        User temp = User.get(user.id) ;
        Resource resource = Resource.get(params.resourceId as long);
        int score = params.score as Integer ;
        ResourceRating rr = ResourceRating.findByResourceAndUser(resource, user) ;

        if(rr == null) rr = new ResourceRating() ;
        rr.resource = resource ;
        rr.user  =user;
        rr.score = score;
        rr.save(flush: true) ;
        temp.resourceRatings.add(rr) ;
        temp.save(flush:true) ;
        session.setAttribute('user', temp) ;
//        render(view: 'Post', model: [res: resource]) ;
        return "This " ;
    }
}
