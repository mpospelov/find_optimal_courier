@admin_users = angular.module('App.admin.users', [])

@admin_users.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'users',
    url: '/admin/users'
    abstract: true
    template: '<ui-view>'
  .state 'users.list',
    url: '/list'
    controller: 'admin_users.ListController'
    controllerAs: 'users_ctrl'
    templateUrl: 'admin/users/templates/index.html'
  .state 'users.new',
    url: '/new'
    controller: 'admin_users.NewController'
    controllerAs: 'users_ctrl'
    templateUrl: 'admin/users/templates/new.html'
  .state 'users.edit',
    url: '/:id'
    controller: 'admin_users.EditController'
    controllerAs: 'users_ctrl'
    templateUrl: 'admin/users/templates/edit.html'
]
