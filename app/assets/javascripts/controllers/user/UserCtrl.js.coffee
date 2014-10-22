module = angular.module('myApp.UserController',['userServices'])
UserController = ($scope, User, $window)->
  handle_failed = (response)->
    $scope.signup_error = response.data
  handle_succeed = ->
    $window.location.href = "/"
  $scope.signup = (user)->
    User.save({user: user}, handle_succeed, handle_failed)

module.controller('UserController',['$scope','User','$window',UserController])
