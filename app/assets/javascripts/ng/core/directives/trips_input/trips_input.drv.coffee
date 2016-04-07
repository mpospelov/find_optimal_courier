@core.directive 'tripsInput', ->
  restrict: 'E'
  templateUrl: 'core/directives/trips_input/trips_input.html'
  scope:
    model: '='
    error: '=?'
    type: '@?'
    label: '@?'
    name: '@?'
    placeholder: '@?'
  link: (scope) ->
    scope.hasError = ->
      !_.isEmpty(scope.error)

    scope.classes = ->
      'has-error': scope.hasError()

    scope.errorMessage = -> scope.error?.join(', ')
