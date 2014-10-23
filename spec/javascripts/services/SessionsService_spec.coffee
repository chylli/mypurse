describe('myApp services', ->
  describe('AuthService', ->
    $httpBackend = null
    AuthService = null
    Session = null
    # Load our app module definition before each test.
    beforeEach(module('myApp.SessionsService'))
    # The injector ignores leading and trailing underscores here (i.e. _$httpBackend_).
    # This allows us to inject a service but then attach it to a variable
    # with the same name as the service in order to avoid a name conflict.
    beforeEach(inject((_$httpBackend_, _AuthService_, _Session_)->
      $httpBackend = _$httpBackend_
      AuthService = _AuthService_
      Session = _Session_
		))
    it('should defined AuthEvents', inject((AUTH_EVENTS)->
      expect(AUTH_EVENTS.NotAuthenticated).toEqual('auth-not-authenticated')
    ))


      
    it('should set Session.user when signin', ->
      $httpBackend.expectPOST('/signin')
        .respond({})
      $httpBackend.expectGET('/user.json')
        .respond({name: 'user1'})

      AuthService.signin()
      $httpBackend.flush()
      expect(Session.user.name).toEqual("user1")
      expect(AuthService.isAuthenticated()).toBe(true)
    )

    it('should send post and destroy session when signout', ->
      Session.user = {name: 'user1'}
      $httpBackend.expectDELETE('/signout')
        .respond({})
      AuthService.signout()
      $httpBackend.flush()
      expect(Session.user).toBeNull()
    )
  )
)

