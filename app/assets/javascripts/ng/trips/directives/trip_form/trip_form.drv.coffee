@trips.directive 'tripForm', ->
  restrict: 'E'
  templateUrl: 'trips/directives/trip_form/trip_form.html'
  scope:
    trip: '='
    tripErrors: '='
    onSubmit: '&'
  link: (scope, element) ->
    center = [55.760165, 37.624483]
    scope.trip.latitude ||= center[0]
    scope.trip.longitude ||= center[1]
    scope.trip.start_time = scope.trip.start_date
    scope.trip.end_time = scope.trip.end_date

    $$toDateTime = (date, time) ->
      new Date(moment(date).format('M-DD-YYYY') + ' ' + moment(time).format('HH:mm'))

    position = [scope.trip.latitude, scope.trip.longitude]
    map = L.map('trip_map').setView(position, 13)
    L.tileLayer(
      'http://{s}.tile.osm.org/{z}/{x}/{y}.png',
      attribution: '© OpenStreetMap contributors').addTo(map)
    marker = L.marker(position).addTo(map);

    map.on 'click', (e) ->
      scope.$applyAsync ->
        scope.trip.latitude = e.latlng.lat
        scope.trip.longitude = e.latlng.lng
        marker.setLatLng(e.latlng)
    scope.submit = ->
      scope.trip.start_date = $$toDateTime(scope.trip.start_date, scope.trip.start_time)
      scope.trip.end_date = $$toDateTime(scope.trip.end_date, scope.trip.end_time)
      scope.onSubmit()
