class @session.LoginController
  session.controller 'session.LoginController', @

  @$inject: ['$rootScope', 'SessionService', '$state']
  constructor: ($rootScope, @SessionService, @$state)->
    @form = {}

  submit: ->
    @SessionService.login(@form).then (user) =>
      alertify.success('Logined successfully!')
      @$state.go('home')
    .catch (response) ->
      alertify.error(response.data.base)
