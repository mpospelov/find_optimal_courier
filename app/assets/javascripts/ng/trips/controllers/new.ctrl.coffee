class trips.NewController
  trips.controller 'trips.NewController', @
  @inject: ['TripsService']

  constructor: (TripsService) ->
    @form = {}

  submit: ->
