@landing = angular.module('App.landing', [])
@landing.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'home',
    url: '/'
    controller: 'landing.LandingController'
    templateUrl: 'landing/templates/index.html'
]
