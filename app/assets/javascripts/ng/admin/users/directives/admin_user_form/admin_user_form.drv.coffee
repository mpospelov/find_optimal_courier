admin_users.directive 'adminUserForm', ['SessionService', (SessionService) ->
  restrict: 'E'
  templateUrl: 'admin/users/directives/admin_user_form/admin_user_form.html'
  scope:
    user: '='
    userErrors: '=?'
    onSubmit: '&?'
  link: (scope) ->
    scope.user.role ||= 'common'
    scope.onSubmit ||= _.noop

    scope.currentUser = -> SessionService.user
]
