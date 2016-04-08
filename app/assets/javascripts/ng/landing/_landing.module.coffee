@landing = angular.module('App.landing', [])
@landing.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'home',
    url: '/'
    controller: 'landing.LandingController'
    templateUrl: 'landing/templates/index.html'
    resolve:
      currentUser: [
        'SessionService',
        (SessionService) ->
          SessionService.onFetchUser
      ]
]
