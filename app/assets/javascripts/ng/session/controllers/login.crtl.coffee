class @session.LoginController
  session.controller 'session.LoginController', @

  @$inject: ['$rootScope', 'SessionService', '$state']
  constructor: ($rootScope, @SessionService, @$state)->
    @form = {}
    @errors = {}

  submit: ->
    @SessionService.login(@form).then (user) =>
      alertify.success('Logined successfully!')
      @$state.go('home')
    .catch (response) ->
      @errors = response.data
      if response.data.base
        alertify.error(response.data.base)
