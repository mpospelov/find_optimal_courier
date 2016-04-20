#= require_tree ./trips
#= require_tree ./users

@admin = angular.module 'App.admin', [
  'App.admin.trips'
  'App.admin.users'
]

@admin.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'admin',
    url: '/admin'
    abstract: true
    template: '<ui-view>'
]
