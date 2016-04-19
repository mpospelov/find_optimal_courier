class admin_trips.ListController
  admin_trips.controller 'admin_trips.ListController', @
  @$inject: ['admin.TripsService', 'dateFormatFilter']

  constructor: (TripsService, @dateFormatFilter) ->
    @trips = TripsService.getList().$object

  delete: (trip) ->
    trip.remove()
    .then =>
      alertify.success('Successfully deleted')
      _.remove(@trips, trip)
