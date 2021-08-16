package linksharing

class UserProfileController {

    def UserProfileService

    def index() {
        User user = User.get(params.userId as long)
        List<Resource> resources = UserProfileService.fetchResources(user)
        List<Topic> topics = UserProfileService.fetchTrending(user)
        List<Subscription> subscription = UserProfileService.fetchSubscriptions(user) ;
        render(view: 'userProfile', model: [resources:resources, topics:topics, subs:subscription, user:user])
    }
}
