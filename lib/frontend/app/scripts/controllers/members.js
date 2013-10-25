'use strict';

angular.module('frontendApp')
  .controller('MembersController', ['$scope', 'Api', function($scope, Api) {
    $scope.members = Api.Members.index();
  }]);