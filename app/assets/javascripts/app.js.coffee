'use strict';

# Declare app level module which depends on views, and components
angular.module('myApp',[
  'ngRoute',
  'myApp.AppController',
  'myApp.SessionsController',
  'myApp.ReportsController',
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
    .otherwise({redirectTo: '/reports'})
]).factory('AuthInterceptor', ($rootScope, $q, AUTH_EVENTS) ->
  return {
    responseError: (response)->
      if response.status is 401 
        $rootScope.$broadcast(AUTH_EVENTS.NotAuthenticated,
                              response);
      
      if response.status is 403
        $rootScope.$broadcast(AUTH_EVENTS.NotAuthorized,
                              response);
      
      if response.status is 419 || response.status is 440 
        $rootScope.$broadcast(AUTH_EVENTS.SessionTimeout,
                              response);
      
      return $q.reject(response);
  };
).config(($httpProvider) ->
    $httpProvider.interceptors.push(['$injector', ($injector) -> 
      $injector.get('AuthInterceptor')
  ])
)
.factory('initPage',($rootScope,AUTH_EVENTS,AuthService,User,Session)->
  {initPage: ->
    # setup currentUser
    currentUser = User.get()
    $rootScope.global = {currentUser: currentUser}
    # setup Session.user
    Session.create(currentUser)
    $rootScope.$on('$locationChangeStart',(event, next) ->
      unless AuthService.isAuthenticated()
        event.preventDefault();
        $rootScope.$broadcast(AUTH_EVENTS.NotAuthenticated)
    )
  }
).run((initPage)->
  initPage.initPage()
)
