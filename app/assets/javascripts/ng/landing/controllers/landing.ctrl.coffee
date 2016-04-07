class @landing.LandingController
  landing.controller 'landing.LandingController', @

  @$inject: ['SessionService', '$state']
  constructor: (SessionService, $state) ->
    $state.go('trips.list') if SessionService.isAuthenticated()
