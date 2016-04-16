trips.factory 'TripsService', ['Restangular', (Restangular) ->
  Restangular.extendModel 'trips', (trip) ->
    trip.end_date = new Date(trip.end_date)
    trip.start_date = new Date(trip.start_date)
    trip

  Restangular.service('trips')
]
