@trips.directive 'tripsFilterForm', ->
  restrict: 'E'
  scope:
    query: '='
    onSubmit: '&?'
    onCancel: '&?'
    onClose: '&?'
  templateUrl: 'trips/directives/trips_filter_form/trips_filter_form.html'
