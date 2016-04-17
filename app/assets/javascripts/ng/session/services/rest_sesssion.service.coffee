session.factory 'RESTSessionService', [
  'Restangular', 'RolesExtenderService',
  (Restangular, RolesExtenderService) ->
    Restangular.extendModel 'session', RolesExtenderService
    Restangular.service('session').one()
]
