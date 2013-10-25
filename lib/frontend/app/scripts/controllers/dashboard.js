'use strict';

angular.module('frontendApp')
  .controller('DashboardController', ['Api', function ($scope, Api) {
    $scope.users = Api.getUsers();
  }]);
