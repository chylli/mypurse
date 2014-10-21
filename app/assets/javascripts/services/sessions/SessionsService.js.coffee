@module = angular.module('myApp.SessionsService',['userServices']);
@AuthEvents = {
  SigninSuccess: 'auth-signin-success',
  SigninFailed: 'auth-signin-failed',
  SignoutSuccess: 'auth-signout-success',
  SessionTimeout: 'auth-session-timeout',
  NotAuthenticated: 'auth-not-authenticated',
  NotAuthorized: 'auth-not-authorized'
};

@AuthService = ($http, Session) ->
  {
    signin: (credentials) -> 
      $http
        .post('/signin', credentials)
        .then((res) -> 
          Session.create(res.data)
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

