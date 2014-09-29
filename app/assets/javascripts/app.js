'use strict';

// Declare app level module which depends on views, and components
angular.module('myApp', [
  'ngRoute',
  'myApp.AppController',
]).config(['$routeProvider', function($routeProvider) {
  $routeProvider
		.when('/signin',{
				templateUrl: 'template/signin',
				controller: 'SigninController',
		})
		.otherwise({redirectTo: '/signin'});
}]);
