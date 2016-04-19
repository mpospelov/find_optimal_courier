#= require angular
#= require angular-rails-templates
#= require angular-bootstrap
#= require angular-animate
#= require lodash
#= require moment
#= require restangular
#= require alertify
#= require ui-router
#= require angular-print/angularPrint
#= require ng/app

@core = angular.module('App.core', [
  'templates'
  'restangular'
  'ngAnimate'
  'ui.router'
  'AngularPrint'
])

@core.config ['$urlRouterProvider', ($urlRouterProvider) ->
  $urlRouterProvider.otherwise('/')
]
