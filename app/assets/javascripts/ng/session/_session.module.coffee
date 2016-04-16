@session = angular.module('App.session', [])

@session.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'login',
    url: '/login'
    controller: 'session.LoginController'
    controllerAs: 'login_ctrl'
    templateUrl: 'session/templates/login.html'
  .state 'registration',
    url: '/registration'
    controller: 'session.RegistrationController'
    controllerAs: 'registration_ctrl'
    templateUrl: 'session/templates/registration.html'
]

@session.run([
  '$rootScope', 'SessionService',
  ($rootScope, SessionService) ->
    $rootScope.session = SessionService
    $rootScope.currentUser = SessionService.user
])

