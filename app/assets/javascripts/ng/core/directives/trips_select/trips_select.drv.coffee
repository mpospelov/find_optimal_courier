@core.directive 'tripsSelect', ->
  restrict: 'E'
  templateUrl: 'core/directives/trips_select/trips_select.html'
  scope:
    model: '='
    options: '&'
    error: '=?'
    label: '@?'
    name: '@?'
  link: (scope) ->
    scope.optionsForSelect = if _.isArray(scope.options())
      _.memoize(
        (->
          _.reduce(scope.options(), ((acc, opt) ->
            acc[opt] = opt
            acc
          ), {})),
        (-> _.keys(scope.options()).length))
    else
      scope.options

    scope.hasError = ->
      !_.isEmpty(scope.error)

    scope.classes = ->
      'has-error': scope.hasError()

    scope.errorMessage = -> scope.error?.join(', ')
