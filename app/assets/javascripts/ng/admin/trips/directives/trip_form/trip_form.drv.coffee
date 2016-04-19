@trips.directive 'adminTripForm', ->
  restrict: 'E'
  templateUrl: 'admin/trips/directives/trip_form/trip_form.html'
  scope:
    trip: '='
    tripErrors: '='
    users: '=?'
    onSubmit: '&'
  link: (scope) ->
    scope.usersOptions = _.memoize(
      (->
        _.reduce(
          scope.users,
          ((acc, u) ->
            acc[u.email] = u.id
            acc),
          {})),
      (-> scope.users?.length))
