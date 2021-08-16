package linksharing

import grails.gorm.transactions.Transactional
import linksharing.Enums.VisibilityEnum

@Transactional
class UserProfileService {

    def serviceMethod() {

    }
    List<Resource> fetchResources(User user) {
        return user.resources as List<Resource> ;

    }
    List<Topic> fetchTrending(User user) {
        List<Topic> topics = Topic.findAllWhere(createdBy: user,visibility: ("PUBLIC" as VisibilityEnum)) ;
        return topics;
    }
    List<Subscription> fetchSubscriptions(User user) {
        return Subscription.findAllByUser(user).sort{it.dateCreated}.reverse()
    }
}
