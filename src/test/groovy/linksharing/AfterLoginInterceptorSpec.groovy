package linksharing

import grails.testing.web.interceptor.InterceptorUnitTest
import linksharing.Interceptors.AfterLoginInterceptor
import spock.lang.Specification

class AfterLoginInterceptorSpec extends Specification implements InterceptorUnitTest<AfterLoginInterceptor> {

    def setup() {
    }

    def cleanup() {

    }

    void "Test afterLogin interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"afterLogin")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
