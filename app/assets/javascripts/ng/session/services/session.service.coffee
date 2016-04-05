@session.service 'SessionService',
  class SessionService
    @$inject: ['Restangular', '$state', '$q']

    constructor: (@Restangular, @$state, @$q) ->
      @user = {}
      @onFetchUserDefer = @$q.defer()
      @onFetchUser = @onFetchUserDefer.promise
      @Restangular.service('user').one().get().then (user) =>
        @setUser(user)
      @RESTsessionService = @Restangular.service('session').one()

    isAuthenticated: ->
      Boolean(@user.id)

    setUser: (user) ->
      _.merge @user, user
      @onFetchUserDefer.resolve(@user)

    logout: ->
      @RESTsessionService.customDELETE().then =>
        @RedirectService.go('/')

    login: (params) ->
      loginDefer = @$q.defer()
      @RESTsessionService.customPOST(params)
        .then (response) =>
          @setUser(response.data)
          loginDefer.resolve(@user)
        .catch loginDefer.reject
      loginDefer.promise

    resendInstructions: (params) ->
      @Restangular.one('confirmation/resend').customPOST(params)

    resetPassword: (params) ->
      @Restangular.one('reset_password/send_instructions').customPOST(params)

    checkAccess: (event, toState, toParams, fromState, fromParams) ->
      if toState?.data?.authenticate_user
        @onFetchUser.then =>
          if !@isAuthenticated()
            @gobgobAlert.error(title: @translateFilter('Not authorized!'))
            if fromState.name
              @$state.go(fromState.name)
            else
              @RedirectService.go('/')
