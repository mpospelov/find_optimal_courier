class trips.NextMonthList
  trips.controller 'trips.NextMonthList', @
  @inject: ['TripsService', 'dateFormatFilter']

  constructor: (@TripsService, @dateFormatFilter) ->
    @selectedMonth = moment().add(1, 'month').startOf('month')
    @fetchTrips()

  month: ->
    @selectedMonth.format('MMMM YYYY')

  nextMonth: ->
    @selectedMonth.add(1, 'month')
    @fetchTrips()

  previousMonth: ->
    @selectedMonth.subtract(1, 'month')
    @fetchTrips()

  fetchTrips: ->
    @TripsService.getList(@$$query())
    .then (data) =>
      @trips = data

  $$query: ->
    selected_month: @dateFormatFilter(@selectedMonth.toDate())
