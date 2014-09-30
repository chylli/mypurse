@module = angular.module('myApp.SessionsController', []);
@SessionsCtrl = ($scope, $http) -> 
    signin_callback = (data)->
      if data.status == 'success'
        window.location = '/';
      else
        $scope.signin_error = data.signin_error

    $scope.signin = ->
      $http.post('/signin',{'email': $scope.email, 'password': $scope.password}).success(signin_callback)


@module.controller('SessionsController', @SessionsCtrl);

