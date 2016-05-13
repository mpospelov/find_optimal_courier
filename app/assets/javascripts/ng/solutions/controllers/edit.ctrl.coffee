class solutions.EditController
  solutions.controller 'solutions.EditController', @
  @$inject: ['SolutionsService', '$state']

  constructor: (SolutionsService, @$state) ->
    SolutionsService.one(@$state.params.id).get()
    .then (data) =>
      @solution = data
    .catch =>
      @$state.go('solutions.list')
      alertify.error('solution not found')

  submit: ->
    @solution.customPUT(@solution)
    .then =>
      @$state.go('solutions.list')
      alertify.success('solution succesfully updated!')
    .catch (response) =>
      @errors = response.data
