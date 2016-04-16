class trips.EditController
  trips.controller 'trips.EditController', @
  @inject: ['TripsService', '$state']

  constructor: (TripsService, @$state) ->
    @trip = TripsService.one(@$state.params.id).get().$object

  submit: ->
    @trip.customPUT(@trip)
    .then =>
      @$state.go('trips.list')
      alertify.success('Trip succesfully updated!')
