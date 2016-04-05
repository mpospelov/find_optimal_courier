#= require_tree ./core
#= require_tree ./landing
#= require_tree ./session

@app = angular.module('App', ['App.core', 'App.session', 'App.landing'])

@app.config [
  'RestangularProvider'
  (RestangularProvider) ->
    RestangularProvider.setBaseUrl '/api'
]
