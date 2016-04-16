#= require_tree ./core
#= require_tree ./landing
#= require_tree ./session
#= require_tree ./trips
#= require_tree ./admin

@app = angular.module 'App', [
  'App.core'
  'App.session'
  'App.landing'
  'App.trips'
  'App.admin'
]

@app.config [
  'RestangularProvider'
  (RestangularProvider) ->
    RestangularProvider.setBaseUrl '/api'
]
