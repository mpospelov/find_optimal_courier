class admin_users.NewController
  admin_users.controller 'admin_users.NewController', @
  @$inject: ['AdminUsersService', '$state']
  constructor: (@AdminUsersService, @$state) ->
    @form = {}
    @errors = {}

  submit: ->
    @AdminUsersService.post(@form)
    .then =>
      @$state.go('admin.users.list')
      alertify.success('User succesfully created!')
    .catch (response) =>
      @errors = response.data

