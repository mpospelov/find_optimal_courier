session.factory 'CurrentUserService', [
  'Restangular', 'RolesExtenderService',
  (Restangular, RolesExtenderService) ->
    Restangular.extendModel 'user', RolesExtenderService

    Restangular.service('user').one()
]
