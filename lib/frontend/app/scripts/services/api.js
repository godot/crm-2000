angular.module('frontendApp').service('Api', ['$http','CurrentUser', function($http, CurrentUser) {
    var apiUrl = 'localhost:3000/api';

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
        Members: {
            index: function() {
                console.log('ads')
                return client.get(apiUrl + '/members');
            },
            
            add: function(data) {
                return client.post(apiUrl + '/members', data);
            },
            
            remove: function(id) {
                return client.delete(apiUrl + '/members/' + id);
            }
        },
        
        registerUser: function(data) {// { user: {phone: '', :password}}
            return client.post(apiUrl + '/users', data);
        }
    };

    return service;
}]);
