class admin_users.NewController
  admin_users.controller 'admin_users.NewController', @
  @$inject: ['admin.UsersService', '$state']
  constructor: (@UsersService, @$state) ->
    @form = {}
    @errors = {}

  submit: ->
    @UsersService.post(@form)
    .then =>
      @$state.go('admin.users.list')
      alertify.success('User succesfully created!')
    .catch (response) =>
      @errors = response.data

