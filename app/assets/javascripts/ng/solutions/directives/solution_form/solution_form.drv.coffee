@solutions.directive 'solutionForm', ->
  restrict: 'E'
  templateUrl: 'solutions/directives/solution_form/solution_form.html'
  scope:
    solution: '='
    solutionErrors: '='
    onSubmit: '&'
