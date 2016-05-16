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

    map = L.map('trip_map').setView(center, 13)
    L.tileLayer(
      'http://{s}.tile.osm.org/{z}/{x}/{y}.png',
      attribution: '© OpenStreetMap contributors').addTo(map)
    marker = L.marker(center).addTo(map);

    map.on 'click', (e) ->
      scope.$applyAsync ->
        scope.trip.latitude = e.latlng.lat
        scope.trip.longitude = e.latlng.lng
        marker.setLatLng(e.latlng)
