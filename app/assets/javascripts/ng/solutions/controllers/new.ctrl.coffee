class solutions.NewController
  solutions.controller 'solutions.NewController', @
  @$inject: ['SolutionsService', '$state']

  constructor: (@SolutionsService, @$state) ->
    @form = {}

  submit: ->
    @SolutionsService.post(@form)
    .then =>
      @$state.go('solutions.list')
      alertify.success('solution succesfully created!')
    .catch (response) =>
      @errors = response.data
