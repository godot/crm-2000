'use strict';

angular.module('frontendApp', [
  'ui.router',
  'ngCookies',
  'ngResource',
  'ngSanitize'
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
    }).state('send', {
        url: '/send',
        templateUrl: 'views/send.html'
    });
});
