userServices = angular.module('userServices', ['ngResource']);

userServices.factory('User', ['$resource', ($resource) ->
  $resource('/user.json', {}, {
   query: {method:'GET'}
  });
]);
  
