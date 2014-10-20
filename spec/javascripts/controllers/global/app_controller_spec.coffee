describe('my App controllers', ->
  describe('AppController', ->
    [scope, ctrl, $httpBackend, resHandler, $rootScope, AUTH_EVENTS] = [null,null,null,null,null,null]

    beforeEach(module('myApp.AppController'))

    beforeEach(inject((_$httpBackend_,_$rootScope_, $controller,_AUTH_EVENTS_)->
      $httpBackend = _$httpBackend_
      $rootScope = _$rootScope_
      AUTH_EVENTS = _AUTH_EVENTS_
      $rootScope.global = {currentUser: {name: 'testuser'}}
      scope = $rootScope.$new()
      ctrl = $controller('AppController', {$scope: scope})
    ))

    it('should set current user to null if app broadcast notauthenticated', ->
      $rootScope.$broadcast(AUTH_EVENTS.NotAuthenticated)
      expect($rootScope.global.currentUser).toBe(null)
    )

    
#
#    it('should assign currentUser after init', ->
#      $httpBackend.flush()
#      expect(scope.global.currentUser.name).toEqual("testuser")
#    )
#
#    it('should unset currentUser when recieved AUTH_EVENTS.NotAuthenticated event', ->
#      $httpBackend.flush()
#      expect(scope.global.currentUser.name).toEqual('testuser')
#      $rootScope.$broadcast(AUTH_EVENTS.NotAuthenticated)
#      expect(scope.global.currentUser).toBe(null)
#    )
  )
)
