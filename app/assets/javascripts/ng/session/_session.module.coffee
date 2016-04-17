@session = angular.module('App.session', [])

@session.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'session',
    url: '/session'
    template: '<ui-view/>'
    resolve:
      currentUser: ['SessionService', (SessionService) ->
        SessionService.onFetchUser
      ]
    onEnter: ['SessionService', '$state', (SessionService, $state) ->
      if SessionService.isAuthenticated()
        $state.go('home')
        alertify.error('You already authenticated')
    ]

  .state 'session.login',
    url: '/login'
    controller: 'session.LoginController'
    controllerAs: 'login_ctrl'
    templateUrl: 'session/templates/login.html'
  .state 'session.registration',
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

