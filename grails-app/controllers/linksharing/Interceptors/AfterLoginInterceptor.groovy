package linksharing.Interceptors

import linksharing.AfterLoginController


class AfterLoginInterceptor {

    public AfterLoginInterceptor() {
        match controller: 'AfterLoginController', action:'createSession' ;
    }


//    boolean after() {
//
//
//    }

    void afterView() {
        println("Interceptor Called") ;
        println("This is working after 15 Seconds");
        render(view: 'index') ;

    }
}
