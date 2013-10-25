angular.module('frontendApp').service('Api', ['$http','CurrentUser', function($http, CurrentUser) {
    var apiUrl = '/api/v1';

    var errorCallback = function(data) {
        alert('cannot connect to the server. please check your internet connection and try again.');
    };

    var client = {
        get: function(url, params) {
            return $http.get(url, params).error(errorCallback);
        },

        post: function(url, data) {
            return $http.post(url, data).error(errorCallback);
        }
    };

    var service = {
        getUsers: function() {
            return [];
        }
    };

    return service;
}]);
