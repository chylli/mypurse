describe('my App controllers', ->
  describe('AppController', ->
    [scope, ctrl, Session, AuthService] = []

    beforeEach(module('myApp.AppController'))

    beforeEach(inject(($rootScope, $controller, _Session_, _AuthService_)->
      scope = $rootScope.$new()
      ctrl = $controller('AppController', {$scope: scope})
      Session = _Session_
      AuthService = _AuthService_
    ))

    it('should set session and authservice', ->
      expect(scope.Session).toBe(Session)
      expect(scope.AuthService).toBe(AuthService)

    )

  )
)
