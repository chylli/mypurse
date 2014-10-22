@module = angular.module('myApp.AppController',['userServices','myApp.SessionsService']);
@controller = ($scope, User, AUTH_EVENTS, Session,AuthService, $location) ->
  #$scope.global = {currentUser : Session.user }
  #console.log($scope.global)
  #$scope.$on(AUTH_EVENTS.NotAuthenticated, ->
  #  $scope.global.currentUser = null
  #)
  $scope.Session = Session
  $scope.AuthService = AuthService
  $scope.shouldShowSigninForm = ()->
    !AuthService.isAuthenticated() && $location.url() != "/signup"
    
@module.controller('AppController',['$scope','User','AUTH_EVENTS','Session','AuthService','$location',@controller])
