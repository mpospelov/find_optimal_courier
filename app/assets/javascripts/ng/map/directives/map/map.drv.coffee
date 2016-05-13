@map.directive 'map',['$timeout', ($timeout) ->
  id = 0
  restrict: 'E'
  templateUrl: 'map/directives/map/map.html'
  scope:
    pointGroups: '='
  link: (scope, element) ->
    scope.mapId = "map#{id}"
    id++

    $$waypointGroups = _.map scope.pointGroups, (group) ->
      _.map group, (point) -> L.latLng(point.latitude, point.longitude)

    $timeout ->
      map = L.map(scope.mapId)
      L.tileLayer(
        'http://{s}.tile.osm.org/{z}/{x}/{y}.png',
        attribution: '© OpenStreetMap contributors').addTo(map)

      _.forEach $$waypointGroups, (group) ->
        L.Routing.control(waypoints: group).addTo(map)
]
