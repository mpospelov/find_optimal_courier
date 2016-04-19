class admin_users.EditController
  admin_users.controller 'admin_users.EditController', @
  @$inject: ['admin.UsersService', '$state']

  constructor: (UsersService, @$state) ->
    @user = {}
    UsersService.one(@$state.params.id).get()
    .then (data) =>
      @user = data
    .catch =>
      @$state.go('admin.users.list')
      alertify.error('User not found')

  submit: ->
    @user.customPUT(@user)
    .then =>
      @$state.go('admin.users.list')
      alertify.success('User succesfully updated!')
