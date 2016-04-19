@admin_trips = angular.module('App.admin.trips', [])

@admin_trips.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'admin.trips',
    url: '/trips'
    abstract: true
    template: '<ui-view>'
    onEnter: ['currentUser', '$state', (currentUser, $state) ->
      if !currentUser.isAdmin()
        $state.go('home')
        alertify.error('You do not have permissions to visit this page')
    ]
  .state 'admin.trips.list',
    url: '/list'
    controller: 'admin_trips.ListController'
    controllerAs: 'trips_ctrl'
    templateUrl: 'admin/trips/templates/index.html'
  .state 'admin.trips.new',
    url: '/new'
    controller: 'admin_trips.NewController'
    controllerAs: 'trips_ctrl'
    templateUrl: 'admin/trips/templates/new.html'
  .state 'admin.trips.edit',
    url: '/:id'
    controller: 'admin_trips.EditController'
    controllerAs: 'trips_ctrl'
    templateUrl: 'admin/trips/templates/edit.html'
]
