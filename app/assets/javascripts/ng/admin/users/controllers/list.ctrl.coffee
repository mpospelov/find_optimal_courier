class admin_users.ListController
  admin_users.controller 'admin_users.ListController', @
  @$inject: ['AdminUsersService']

  constructor: (AdminUsersService) ->
    AdminUsersService.getList()
    .then (data) =>
      @users = data

  delete: (user)->
    user.remove()
    .then =>
      _.remove @users, user
      alertify.success('User successfully deleted!')
