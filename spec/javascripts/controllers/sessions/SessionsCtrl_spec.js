describe('myPurse controllers', function() {

  describe('SessionsCtrl', function(){
    var scope, ctrl, $httpBackend;

    // Load our app module definition before each test.
    beforeEach(module('myPurse'));

    // The injector ignores leading and trailing underscores here (i.e. _$httpBackend_).
    // This allows us to inject a service but then attach it to a variable
    // with the same name as the service in order to avoid a name conflict.
    beforeEach(inject(function(_$httpBackend_, $rootScope, $controller) {
      $httpBackend = _$httpBackend_;
      $httpBackend.expectPOST('/signin').
          respond({status: 'error', signin_error: "has an error"});

      scope = $rootScope.$new();
      ctrl = $controller('SessionsCtrl', {$scope: scope});
    }));

    it('should create erroe message fetched from xhr', function() {
      expect(scope.signin_error).toBeUndefined();
		  scope.signin();
      $httpBackend.flush();
      expect(scope.signin_error).toEqual("has an error");
    });
});
});
