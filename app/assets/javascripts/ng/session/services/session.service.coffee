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
        @user = {}
        @$state.go('home')

    login: (params) ->
      loginDefer = @$q.defer()
      @RESTsessionService.customPOST(params)
        .then (data) =>
          @setUser(data)
          loginDefer.resolve(@user)
        .catch loginDefer.reject
      loginDefer.promise

    checkAccess: (event, toState, toParams, fromState, fromParams) ->
