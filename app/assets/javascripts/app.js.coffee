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
]).factory('initPage',($rootScope,AUTH_EVENTS,AuthService,User,Session)->
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
