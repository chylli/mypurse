@module = angular.module('myApp.SessionsService',['userServices']);
# please refer to http://www.tuicool.com/articles/mIFzam
@AuthEvents = {
  NotAuthenticated: 'auth-not-authenticated',
};

@AuthService = ($http, Session) ->
  {
    signin: (credentials) -> 
      $http
        .post('/signin', credentials)
        .then((res) -> 
          Session.create()
        )
    signout: () ->
      $http.delete('/signout')
      .then(()->
        Session.destroy()
      )
    ,
    isAuthenticated: -> 
      !!Session.user;
    
  }

Session = (User)->
  @create = (@user = User.get()) -> 

  @destroy = ->
    @user = null

  @


@module.factory('AuthService', ['$http', 'Session', @AuthService])
  .constant('AUTH_EVENTS',AuthEvents)
  .service('Session', ['User',Session]);

