class trips.ListController
  trips.controller 'trips.ListController', @
  @inject: ['TripsService']

  constructor: (@TripsService) ->
    @query = {}
    @fetchTrips()
    @showFilter = false

  fetchTrips: ->
    @TripsService.getList(@query)
    .then (data) =>
      @trips = data

  filterFormBtnLabel: ->
    if @showFilter then 'Hide filter' else 'Show filter'

  toogleFilterForm: ->
    @showFilter = !@showFilter

  daysToStart: (trip) ->
    if @$$isFuture(trip)
      @$$startDateDiff(trip)
    else if @$$isPast(trip)
      'Ended'
    else
      'Started'

  delete: (trip) ->
    trip.remove()
    .then =>
      alertify.success('Successfully deleted')
      _.remove(@trips, trip)

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
