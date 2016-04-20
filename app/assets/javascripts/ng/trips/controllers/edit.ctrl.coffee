class trips.EditController
  trips.controller 'trips.EditController', @
  @$inject: ['TripsService', '$state']

  constructor: (TripsService, @$state) ->
    TripsService.one(@$state.params.id).get()
    .then (data) =>
      @trip = data
    .catch =>
      @$state.go('trips.list')
      alertify.error('Trip not found')

  submit: ->
    @trip.customPUT(@trip)
    .then =>
      @$state.go('trips.list')
      alertify.success('Trip succesfully updated!')
    .catch (response) =>
      @errors = response.data
