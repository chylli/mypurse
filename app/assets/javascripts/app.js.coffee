'use strict';

# Declare app level module which depends on views, and components
angular.module('myApp',[
  'ngRoute',
  'myApp.AppController',
  'myApp.SessionsController',
  'myApp.ReportsController',
  'myApp.UserController',
  'userServices'
#  'myApp.SignupController'
]).config(['$routeProvider', ($routeProvider) ->
  $routeProvider
    .when('/signin',{
      templateUrl: 'template/signin',
      controller: 'SessionsController',
    })
    .when('/reports',{
      templateUrl: 'template/reports',
      controller: 'ReportsController'
    })
    .when('/signup',{
      templateUrl: 'template/user/new',
      controller: 'UserController'
    })
    .when('/contact',{
      templateUrl: 'template/contact'
    })
    .when('/about',{
      templateUrl: 'template/about'
    })

    .otherwise({redirectTo: '/reports'})
]).factory('AuthInterceptor', ['$rootScope', '$q', 'AUTH_EVENTS', ($rootScope, $q, AUTH_EVENTS) ->
  return {
    responseError: (response)->
      if response.status is 401
        $rootScope.$broadcast(AUTH_EVENTS.NotAuthenticated,
                              response);
      
      return $q.reject(response);
  }
]).config(['$httpProvider', ($httpProvider) ->
    $httpProvider.interceptors.push(['$injector', ($injector) -> 
      $injector.get('AuthInterceptor')
  ])
])
.factory('initPage',['$rootScope','AUTH_EVENTS','AuthService','User','Session', ($rootScope,AUTH_EVENTS,AuthService,User,Session)->
  {initPage: ->
    # setup Session.user
    Session.create()
    $rootScope.$on('$locationChangeStart',(event, next) ->
      unless AuthService.isAuthenticated() or next.match(/signup|signin/)
        event.preventDefault();
    )
    $rootScope.$on(AUTH_EVENTS.NotAuthenticated,()->
      Session.destroy()
    )
  }
]).run(['initPage', (initPage)->
  initPage.initPage()
])
