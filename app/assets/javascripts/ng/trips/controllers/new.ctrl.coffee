class trips.NewController
  trips.controller 'trips.NewController', @
  @$inject: ['TripsService', '$state']

  constructor: (@TripsService, @$state) ->
    @form = {}

  submit: ->
    @TripsService.post(@form)
    .then =>
      debugger
      @$state.go('trips.list')
      alertify.success('Trip succesfully created!')
    .catch (response) =>
      @errors = response.data
