'use strict';

angular.module('frontendApp').controller('RegisterController', ['$scope', 'Api', function($scope, Api) {
    $scope.phone = null;
    $scope.password = null;
    $scope.password_confirmation = null;
    
    $scope.registerUser = function() {
        Api.registerUser({
            user: {
                phone: $scope.phone,
                password: $scope.password,
                password_confirmation: $scope.password_confirmation
            }
        }).then(setCurrentUser);
    };
    
    var setCurrentUser = function(response) {
        console.log(response);
        CurrentUser.set();
    }
}]);