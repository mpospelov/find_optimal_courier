@session.service 'SessionService',
  class SessionService
    @$inject: ['CurrentUserService', 'RESTSessionService', '$state', '$q']

    constructor: (CurrentUserService, @RESTSessionService, @$state, @$q) ->
      @user = {}
      @onFetchUserDefer = @$q.defer()
      @onFetchUser = @onFetchUserDefer.promise
      CurrentUserService.get()
        .then (user) =>
          @setUser(user)
        .catch =>
          @setUser({})

    isAuthenticated: ->
      Boolean(@user.id)

    setUser: (user) ->
      _.merge @user, user
      @onFetchUserDefer.resolve(@user)

    logout: ->
      @RESTSessionService.customDELETE().then =>
        @user = {}
        @$state.go('home')

    login: (params) ->
      loginDefer = @$q.defer()
      @RESTSessionService.customPOST(params)
        .then (data) =>
          @setUser(data)
          loginDefer.resolve(@user)
        .catch loginDefer.reject
      loginDefer.promise
