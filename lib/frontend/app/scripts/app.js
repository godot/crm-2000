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
    }).state('main', {
        url: '/',
        templateUrl: 'views/main.html'
    });
});
