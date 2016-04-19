admin_trips.factory 'admin.TripsService', ['Restangular', (Restangular) ->
  Restangular.extendModel 'admin/trips', (trip) ->
    trip.end_date = new Date(trip.end_date)
    trip.start_date = new Date(trip.start_date)
    trip

  Restangular.service('admin/trips')
]
