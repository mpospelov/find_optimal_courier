class admin_users.EditController
  admin_users.controller 'admin_users.EditController', @
  @$inject: ['AdminUsersService', '$state']

  constructor: (AdminUsersService, @$state) ->
    @user = {}
    AdminUsersService.one(@$state.params.id).get()
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
