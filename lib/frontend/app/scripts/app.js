'use strict';

angular.module('frontendApp', [
  'ui.router',
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'angular-chosen'
])

.config(function($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise('/');
    return $stateProvider.state('home', {
        url: '/home',
        templateUrl: 'views/home.html',
    }).state('dashboard', {
        url: '/',
        templateUrl: 'views/dashboard.html'
    }).state('settings', {
        url: '/settings',
        templateUrl: 'views/settings.html'
    }).state('register', {
        url: '/register',
        templateUrl: 'views/register.html'
    }).state('login', {
        url: '/login',
        templateUrl: 'views/login.html'
    }).state('send', {
        url: '/send',
        templateUrl: 'views/send.html'
    });
})
.run(['$rootScope', '$state', 'CurrentUser', function($rootScope, $state, CurrentUser) {
    $rootScope.$on("$stateChangeStart", function(event, toState) {
        var user = CurrentUser.get();

        if (!user && toState.url != '/login') {
            $state.transitionTo('login');
            console.log('a')
        }
    });
}]);

