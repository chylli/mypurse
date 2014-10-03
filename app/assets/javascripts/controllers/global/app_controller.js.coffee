@module = angular.module('myApp.AppController',['userServices','myApp.SessionsService']);
@controller = ($scope, User, AUTH_EVENTS, Session) ->
  #$scope.global = {currentUser : Session.user }
  #console.log($scope.global)
  $scope.$on(AUTH_EVENTS.NotAuthenticated, ->
    $scope.global.currentUser = null
  )
@module.controller('AppController',@controller)
