@admin_users = angular.module('App.admin.users', [])

@admin_users.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'admin.users',
    url: '/users'
    abstract: true
    template: '<ui-view>'
    onEnter: ['currentUser', '$state', (currentUser, $state) ->
      return if currentUser.isManager() || currentUser.isAdmin()
      $state.go('home')
      alertify.error('You do not have permissions to visit this page')
    ]
  .state 'admin.users.list',
    url: '/list'
    controller: 'admin_users.ListController'
    controllerAs: 'users_ctrl'
    templateUrl: 'admin/users/templates/list.html'
  .state 'admin.users.new',
    url: '/new'
    controller: 'admin_users.NewController'
    controllerAs: 'users_ctrl'
    templateUrl: 'admin/users/templates/new.html'
  .state 'admin.users.edit',
    url: '/:id'
    controller: 'admin_users.EditController'
    controllerAs: 'users_ctrl'
    templateUrl: 'admin/users/templates/edit.html'
]
