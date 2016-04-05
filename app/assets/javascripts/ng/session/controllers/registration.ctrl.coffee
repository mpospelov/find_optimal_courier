class @session.RegistrationController
  session.controller 'session.RegistrationController', @

  @$inject: ['Restangular', '$state']
  constructor: (Restangular, @$state) ->
    @form = {}
    @RegistrationService = Restangular.service('registration')

  submit: ->
    @RegistrationService.post(@form).then (data) ->
      alertify.success('Sign up successfully!')
      @$state.go('home')
    .catch (response)->
      alertify.error(response.data.base)
