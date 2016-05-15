@map.directive 'map',['$timeout', ($timeout) ->
  id = 0
  restrict: 'E'
  templateUrl: 'map/directives/map/map.html'
  scope:
    pointGroups: '='
  link: (scope, element) ->
    scope.maps = []
    $$waypointGroups = _.map scope.pointGroups, (group) ->
      _.map group, (point) -> L.latLng(point[0], point[1])

    _.forEach $$waypointGroups, (group) ->
      mapId = "map#{id}"
      scope.maps.push(mapId)
      id++
      $timeout ->
        map = L.map(mapId)
        L.tileLayer(
          'http://{s}.tile.osm.org/{z}/{x}/{y}.png',
          attribution: '© OpenStreetMap contributors').addTo(map)
        L.Routing.control(waypoints: group).addTo(map)
]
