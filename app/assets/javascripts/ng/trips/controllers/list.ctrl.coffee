class trips.ListController
  trips.controller 'trips.ListController', @
  @inject: ['TripsService']

  constructor: (TripsService) ->
    @trips = TripsService.getList().$object

  daysToStart: (trip) ->
    if @$$isFuture(trip)
      @$$startDateDiff(trip)
    else
      'Already started'

  tripClasses: (trip) ->
    'is-past': @$$isPast(trip)
    'is-active': @$$isActive(trip)
    'is-future': @$$isFuture(trip)

  $$isPast: (trip) ->
    @$$endDateDiff(trip) < 0

  $$isActive: (trip) ->
    moment().isBetween(trip.start_date, trip.end_date)

  $$isFuture: (trip) ->
    @$$startDateDiff(trip) >= 0

  $$startDateDiff: (trip) ->
    moment(trip.start_date).diff(new Date(), 'days')

  $$endDateDiff: (trip) ->
    moment(trip.end_date).diff(new Date(), 'days')
