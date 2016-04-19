class trips.ListController
  trips.controller 'trips.ListController', @
  @$inject: ['TripsService', 'dateFormatFilter']

  constructor: (@TripsService, @dateFormatFilter) ->
    @query = {}
    @fetchTrips()
    @showFilter = false

  fetchTrips: ->
    @TripsService.getList(@$$filterQuery(@query))
    .then (data) =>
      @trips = data

  cancelFilter: ->
    @query = {}
    @fetchTrips()

  closeFilterForm: ->
    @showFilter = false

  filterFormBtnLabel: ->
    if @showFilter then 'Hide filter' else 'Show filter'

  toogleFilterForm: ->
    @showFilter = !@showFilter

  delete: (trip) ->
    trip.remove()
    .then =>
      alertify.success('Successfully deleted')
      _.remove(@trips, trip)

  tripClasses: (trip) ->
    'is-past': trip.isPast()
    'is-active': trip.isActive()
    'is-future': trip.isFuture()

  $$filterQuery: (query) ->
    query = _.clone(query)
    query.starts_after = if !!query.starts_after then @dateFormatFilter(query.starts_after)
    query.ends_before = if !!query.ends_before then @dateFormatFilter(query.ends_before)
    query
