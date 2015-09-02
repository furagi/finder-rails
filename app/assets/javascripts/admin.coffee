#= require angular-file-upload/angular-file-upload-html5-shim
#= require angular
#= require angular-file-upload/angular-file-upload
#= require angular-cookies
#= require angular-resource
#= require angular-route
#= require_self
#= require_tree ./admin-app/controllers
#= require_tree ./admin-app/services
#= require_tree ./admin-app/directives

'use strict';


# Declare app level module which depends on filters, and services
admin_app = angular.module 'admin_app', [
    'ngRoute'
    'angularFileUpload'
    'finder_controllers'
    'finder_services'
    'finder_directives'
]

admin_app.config([
    '$routeProvider'
    ($routeProvider) ->
        $routeProvider.when('/', {
                controller: 'AdminCtrl'
            }).otherwise({
                redirectTo: '/'
            })
])


finder_directives = angular.module 'finder_directives', ['ngCookies']

finder_services = angular.module 'finder_services', [
    'ngResource'
]
.config [
    '$provide'
    '$httpProvider',
    ($provide, $httpProvider) ->
        $provide.factory "myHttpInterceptor", ($q, $log) ->
            responseError: (rejection) ->
                $log.debug "error with status #{rejection.status} and data: #{rejection.data.message or rejection.data}"
                switch rejection.status
                    when 401
                        window.location = '/sessions/new'
                        return
                    when 0
                        $log.error "No connection, internet is down?"
                    else
                        alert "#{rejection.data.message or rejection.data}"
                        $log.error "#{rejection.data['message']}"

                $q.reject rejection
        $httpProvider.interceptors.push 'myHttpInterceptor'
]

finder_controllers = angular.module 'finder_controllers', []
