class solutions.ListController
  solutions.controller 'solutions.ListController', @
  @$inject: ['SolutionsService']

  constructor: (SolutionsService) ->
    @solutions = SolutionsService.getList().$object
