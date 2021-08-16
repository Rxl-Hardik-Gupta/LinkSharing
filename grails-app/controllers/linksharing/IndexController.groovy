package linksharing


class IndexController {
    def IndexService ;

    def index() {
        if(session && session.getAttribute('user') != null) {
            redirect(controller: 'dashboard') ;
        }
        else{
            Map map = new HashMap() ;
            List<Resource> resourceList = IndexService.fetchLatestResources() ;
            map.put('latestResources', resourceList) ;
            List<Topic> trendingTopics = IndexService.fetchTrending() ;
            for(def key : map.keySet()) {
                println "this is mappppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp" ;
                println key + " " + map.get(key) ;
            }
            render(view: '../index', model: ["latestResources": resourceList, trending:trendingTopics]);
        }
    }


    def dashboard() {
        render(view:'../Dashboard/index') ;
    }




    def login(){

        Map map = IndexService.AuthenticateCredentials(params) ;
        if(!map.message.equals("")) {
            flash.message = map.message;
            redirect(uri: '/') ;
        }
        else {
            User user = map.user;
            session.setAttribute('user', user) ;
//            render(view: '/Dashboard/index') ;
//            session.setAttribute('trending', map.trending) ;
//            redirect(controller:'dashboard') ;
            println(session.getAttribute('user'))
            redirect(controller: 'dashboard') ;
        }
    }



    def register() {

        Map map = IndexService.createUser(request, params) ;
        if(map.exception == null) flash.registerMessage = map.message ;
        else flash.error = map.exception;
        println(map.exception) ;
        redirect(uri:'/');

    }



}
