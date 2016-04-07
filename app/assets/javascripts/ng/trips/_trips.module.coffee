@trips = angular.module('App.trips', [])

@trips.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'trips',
    url: '/trips'
    abstract: true
    template: '<ui-view>'
  .state 'trips.list',
    url: '/list'
    controller: 'trips.ListController'
    controllerAs: 'trips_ctrl'
    templateUrl: 'trips/templates/index.html'
  .state 'trips.new',
    url: '/new'
    controller: 'trips.NewController'
    controllerAs: 'trips_ctrl'
    templateUrl: 'trips/templates/new.html'
]
