#= require angular
#= require angular-rails-templates
#= require angular-bootstrap
#= require angular-route
#= require restangular
#= require alertify
#= require ui-router
#= require ng/app

@core = angular.module('App.core', [
  'templates'
  'restangular'
  'ui.router'
])

@core.config ['$urlRouterProvider', ($urlRouterProvider) ->
  $urlRouterProvider.otherwise("/")
]

@core.run([
  '$rootScope', 'SessionService',
  ($rootScope, SessionService) ->
    # defining rootscope binding
    $rootScope.session = SessionService
    $rootScope.currentUser = SessionService.user

    # checking access of current user
    $rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
      SessionService.checkAccess(event, toState, toParams, fromState, fromParams)
])

