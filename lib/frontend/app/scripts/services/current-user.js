angular.module('frontendApp').service('CurrentUser', function() {
    var _key = 'current-user';
    var serialize = function(val) { return JSON.stringify(val); };
    var deserialize = function(val) { return JSON.parse(val); };
    
    return {
        get: function() {
            return deserialize(sessionStorage.getItem(_key)); 
        },
        set: function(user) { 
            return sessionStorage.setItem(_key, serialize(user)); 
        }
    };
});