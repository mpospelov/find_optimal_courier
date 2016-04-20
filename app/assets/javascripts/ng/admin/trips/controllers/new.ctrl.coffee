class admin_trips.NewController
  admin_trips.controller 'admin_trips.NewController', @
  @$inject: ['admin.TripsService', '$state', 'admin.UsersService']

  constructor: (@TripsService, @$state, UsersService) ->
    @users = UsersService.getList().$object
    @form = {}

  submit: ->
    @TripsService.post(@form)
    .then =>
      @$state.go('admin.trips.list')
      alertify.success('Trip succesfully created!')
    .catch (response) =>
      @errors = response.data
