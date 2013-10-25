'use strict';

describe('Controller: DashboardController', function () {

  // load the controller's module
  beforeEach(module('frontendApp'));
  beforeEach(module('ui.router'));

  var DashboardController,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    DashboardController = $controller('DashboardController', {
      $scope: scope
    });
  }));

  it('should attach a list of users to the scope', function () {
    expect(scope.users).not.toBeFalsy();
    expect(scope.users).toEqual(jasmine.any(Array));
  });
});
