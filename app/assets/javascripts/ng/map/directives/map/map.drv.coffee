@map.directive 'map',['$timeout', ($timeout) ->
  id = 0
  restrict: 'E'
  templateUrl: 'map/directives/map/map.html'
  scope:
    trips: '='
  link: (scope, element) ->
    scope.mapId = "map#{id}"
    id++

    $$waypoints = _.map scope.trips, (trip) ->
      L.latLng(trip.latitude, trip.longitude)

    $timeout ->
      map = L.map(scope.mapId)

      L.tileLayer(
        'http://{s}.tile.osm.org/{z}/{x}/{y}.png',
        attribution: '© OpenStreetMap contributors').addTo(map)
      L.Routing.control(waypoints: $$waypoints, routeWhileDragging: true).addTo(map)
]
