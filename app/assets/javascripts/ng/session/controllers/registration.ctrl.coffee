class session.RegistrationController
  session.controller 'session.RegistrationController', @
  @$inject: ['RegistrationService', 'SessionService', '$state']

  constructor: (@RegistrationService, @SessionService, @$state) ->
    @form = {}
    @errors = {}

  submit: ->
    @RegistrationService.post(@form).then (user) =>
      alertify.success('Sign up successfully!')
      @SessionService.setUser(user)
      @$state.go('trips.list')
    .catch (response) =>
      @errors = response.data
      if response.data.base
        alertify.error(response.data.base)
