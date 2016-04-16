#= require_tree ./trips
#= require_tree ./users

@admin = angular.module 'App.admin', [
  'App.admin.trips'
  'App.admin.users'
]
