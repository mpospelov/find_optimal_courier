trips.factory 'TripsService', ['Restangular', (Restangular) ->
  $$startDateDiff = (trip) ->
    moment(trip.start_date).diff(new Date(), 'days')

  $$endDateDiff = (trip) ->
    moment(trip.end_date).diff(new Date(), 'days')

  Restangular.extendModel 'trips', (trip) ->
    trip.end_date = new Date(trip.end_date)
    trip.start_date = new Date(trip.start_date)

    trip.isPast = ->
      $$endDateDiff(trip) < 0

    trip.isActive = ->
      moment().isBetween(trip.start_date, trip.end_date)

    trip.isFuture = ->
      $$startDateDiff(trip) >= 0

    trip.daysToStart = ->
      if trip.isFuture()
        $$startDateDiff(trip)
      else if trip.isPast()
        'Ended'
      else
        'Started'

    trip

  Restangular.service('trips')
]
