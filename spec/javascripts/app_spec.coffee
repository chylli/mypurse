describe('myApp run ', ->
  [initPage, $httpBackend, Session,$rootScope,AUTH_EVENTS] = []
  
  beforeEach(module('myApp'))
  beforeEach(inject((_initPage_,_$httpBackend_, _Session_, _$rootScope_,_AUTH_EVENTS_)->
    [initPage,$httpBackend,Session,$rootScope,AUTH_EVENTS] = [_initPage_, _$httpBackend_,_Session_, _$rootScope_,_AUTH_EVENTS_]
  ))

  it('should setup currentUser',->
    $httpBackend.expectGET('/user.json').respond({name: 'user1'})
    #neednot call it again because when init module('myApp'), the code is alread run
    #initPage.initPage()
    $httpBackend.flush();
    expect($rootScope.global.currentUser.name).toEqual('user1')
    expect(Session.user.name).toEqual('user1')
  )

  it('should broadcast NotAuthenticated if http return 401',->
    getBroadcast = false
    $rootScope.$on(AUTH_EVENTS.NotAuthenticated,() -> getBroadcast = true)
    $httpBackend.expectGET('/user.json').respond(401,{})
    $httpBackend.flush()
    expect(getBroadcast).toBe(true)
  )

)




