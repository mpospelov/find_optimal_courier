class trips.EditController
  trips.controller 'trips.EditController', @
  @$inject: ['trip', '$state']

  constructor: (@trip, @$state) ->

  submit: ->
    @trip.customPUT(@trip)
    .then =>
      @$state.go('trips.list')
      alertify.success('Trip succesfully updated!')
    .catch (response) =>
      @errors = response.data
