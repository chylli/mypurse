#TODO use then to process the success
@module = angular.module('myApp.SessionsController', ['myApp.SessionsService']);
@SessionsCtrl = ($scope, AuthService, Session, AUTH_EVENTS, $window) -> 
    handle_success = ->
      $window.location.reload()
      
    handle_failed = (response) ->
        $scope.signin_error = response.data.signin_error

    $scope.signin = (credentials)->
      AuthService.signin(credentials).then(handle_success,handle_failed);

    $scope.signout = ()->
      AuthService.signout()

@module.controller('SessionsController', ['$scope','AuthService','Session','AUTH_EVENTS','$window',@SessionsCtrl]);

