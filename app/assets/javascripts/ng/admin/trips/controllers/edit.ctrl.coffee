class admin_trips.EditController
  admin_trips.controller 'admin_trips.EditController', @
  @$inject: ['admin.TripsService', '$state', 'admin.UsersService']

  constructor: (TripsService, @$state, UsersService) ->
    @users = UsersService.getList().$object
    TripsService.one(@$state.params.id).get()
    .then (data) =>
      @trip = data
    .catch =>
      @$state.go('admin.trips.list')
      alertify.error('Trip not found')

  submit: ->
    @trip.customPUT(@trip)
    .then =>
      @$state.go('admin.trips.list')
      alertify.success('Trip succesfully updated!')
    .catch (response) =>
      @errors = response.data
