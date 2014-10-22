describe('my App controllers', ->
  describe('AppController', ->
    [scope, ctrl, Session, AuthService, $location] = []

    beforeEach(module('myApp.AppController'))

    beforeEach(inject(($rootScope, $controller, _Session_, _AuthService_, _$location_)->
      scope = $rootScope.$new()
      ctrl = $controller('AppController', {$scope: scope})
      Session = _Session_
      AuthService = _AuthService_
      $location = _$location_
    ))

    it('should set session and authservice', ->
      expect(scope.Session).toBe(Session)
      expect(scope.AuthService).toBe(AuthService)

    )

    describe('function shouldShowSigninForm',->
      it('should return true', ->
        oldUrl = $location.url
        $location.url = () -> '/signup'
        expect(scope.shouldShowSigninForm()).toBe(false)
        $location.url = oldUrl
      )

  )
 
  )
)
