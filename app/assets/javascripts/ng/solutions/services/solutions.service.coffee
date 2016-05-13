solutions.factory 'SolutionsService', ['Restangular', (Restangular) ->
  Restangular.extendModel 'solutions', (solution) ->
    solution.isCompleted = -> @state == 'completed'
    solution

  Restangular.service('solutions')
]
