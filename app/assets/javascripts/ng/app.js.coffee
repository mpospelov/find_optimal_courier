#= require_tree ./core
#= require_tree ./landing
#= require_tree ./session
#= require_tree ./trips
#= require_tree ./admin
#= require_tree ./map
#= require_tree ./solutions

@app = angular.module 'App', [
  'App.core'
  'App.session'
  'App.landing'
  'App.trips'
  'App.admin'
  'App.solutions'
  'App.map'
]

@app.config [
  'RestangularProvider'
  (RestangularProvider) ->
    RestangularProvider.setBaseUrl '/api'
]
