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
    templateUrl: 'trips/templates/list.html'
  .state 'trips.next_month_list',
    url: '/next_month_list'
    controller: 'trips.NextMonthList'
    controllerAs: 'trips_ctrl'
    templateUrl: 'trips/templates/next_month_list.html'
  .state 'trips.new',
    url: '/new'
    controller: 'trips.NewController'
    controllerAs: 'trips_ctrl'
    templateUrl: 'trips/templates/new.html'
  .state 'trips.edit',
    url: '/:id'
    controller: 'trips.EditController'
    controllerAs: 'trips_ctrl'
    templateUrl: 'trips/templates/edit.html'
]
