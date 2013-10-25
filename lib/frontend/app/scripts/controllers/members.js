'use strict';

angular.module('frontendApp')
  .controller('MembersController', ['$scope', 'Api', function($scope, Api) {
    $scope.init = function() {
      Api.Members.index().then(assignMembersToScope);
    }
    
    var assignMembersToScope = function(response) {
      $scope.members = response.members
    };
  }]);