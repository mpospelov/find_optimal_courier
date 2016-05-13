@solutions = angular.module('App.solutions', [])

@solutions.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'solutions',
    url: '/solutions'
    abstract: true
    template: '<ui-view>'
  .state 'solutions.list',
    url: '/list'
    controller: 'solutions.ListController'
    controllerAs: 'solutions_ctrl'
    templateUrl: 'solutions/templates/list.html'
  .state 'solutions.new',
    url: '/new'
    controller: 'solutions.NewController'
    controllerAs: 'solutions_ctrl'
    templateUrl: 'solutions/templates/new.html'
  .state 'solutions.show',
    url: '/:id'
    controller: 'solutions.ShowController'
    controllerAs: 'solutions_ctrl'
    templateUrl: 'solutions/templates/show.html'
    resolve:
      solution: [
        '$stateParams', 'SolutionsService',
        ($stateParams, SolutionsService) ->
          SolutionsService.one($stateParams.id).get()
      ]
]
