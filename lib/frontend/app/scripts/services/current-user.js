angular.module('frontendApp').service('CurrentUser', ['$http', function($http) {
    var _key = 'current-user';
    var serialize = function(val) { return JSON.stringify(val); };
    var deserialize = function(val) { return JSON.parse(val); };
    
    return {
        get: function() {
            var user = deserialize(sessionStorage.getItem(_key));
            if (user) {
                $http.defaults.headers.common['Authorization'] = "Token token=" + user.authentication_token
            }
            return user; 
        },
        set: function(user) {
            $http.defaults.headers.common['Authorization'] = "Token token=" + user.authentication_token
            return sessionStorage.setItem(_key, serialize(user)); 
        }
    };
}]);