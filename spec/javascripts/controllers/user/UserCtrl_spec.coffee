describe('myPurse controlers', ->
  describe('UserController', ->
    [scope,ctrl, $httpBackend] = []
    
  
    window = {location: {href:'/abc'}}
    beforeEach(->
      module(($provide)->
        $provide.value('$window',window)
        return
      )
    )


    beforeEach(module('myApp.UserController'))

    beforeEach(inject((_$httpBackend_, $rootScope, $controller)->
      $httpBackend = _$httpBackend_
      scope = $rootScope.$new()
      #ctrl = $controller('UserController',{$scope: scope, $window: window})
      ctrl = $controller('UserController',{$scope: scope})
    ))


    it('should set error message fetched from xhr', ->
      $httpBackend.expectPOST('/user.json')
        .respond(406, {name: ["name error"]})
      scope.signup()
      $httpBackend.flush()
      expect(scope.signup_error.name[0]).toBe('name error')
    )

    it('will redirect to / after signup successful', ->
      $httpBackend.expectPOST('/user.json')
        .respond({})
      scope.signup()
      $httpBackend.flush()
      expect(window.location.href).toBe('/')
    )

  )
)
