@trips.directive 'tripForm', ->
  restrict: 'E'
  templateUrl: 'trips/directives/trip_form/trip_form.html'
  scope:
    trip: '='
    tripErrors: '='
    onSubmit: '&'
