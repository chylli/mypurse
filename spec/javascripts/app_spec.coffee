describe('myApp run ', ->
  [initPage, $httpBackend, Session,$rootScope] = []
  
  beforeEach(module('myApp'))
  beforeEach(inject((_initPage_,_$httpBackend_, _Session_, _$rootScope_)->
    [initPage,$httpBackend,Session,$rootScope] = [_initPage_, _$httpBackend_,_Session_, _$rootScope_]
    $httpBackend.expectGET('/user.json').respond({name: 'user1'})
    $httpBackend.expectGET('/user.json').respond({name: 'user1'})
  ))

  it('should setup currentUser',->
    initPage.initPage()
    $httpBackend.flush();
    expect($rootScope.global.currentUser.name).toEqual('user1')
    expect(Session.user.name).toEqual('user1')
  )

)




