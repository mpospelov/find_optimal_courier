class trips.NextDayMap
  trips.controller 'trips.NextDayMap', @
  @$inject: ['TripsService', 'dateFormatFilter']

  constructor: (@TripsService, @dateFormatFilter) ->
    @selectedDay = moment().add(1, 'day').startOf('day')
    @fetchTrips()

  day: ->
    @selectedDay.format('MMMM YYYY D')

  nextDay: ->
    @selectedDay.add(1, 'day')
    @fetchTrips()

  previousDay: ->
    @selectedDay.subtract(1, 'day')
    @fetchTrips()

  fetchTrips: ->
    @TripsService.getList(@$$query())
    .then (data) =>
      @tripsLoaded = true
      @trips = data

  $$query: ->
    selected_day: @dateFormatFilter(@selectedDay.toDate())
