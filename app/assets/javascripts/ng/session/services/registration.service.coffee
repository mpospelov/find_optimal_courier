session.factory 'RegistrationService', [
  'Restangular', 'RolesExtenderService', (Restangular, RolesExtenderService) ->
    Restangular.extendModel 'registration', RolesExtenderService
    Restangular.service('registration')
]
