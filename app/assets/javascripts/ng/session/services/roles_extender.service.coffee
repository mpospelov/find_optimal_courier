session.factory 'RolesExtenderService', ->
  (user) ->
    user.isAdmin = -> @role == 'admin'
    user.isManager = -> @role == 'manager'
    user
