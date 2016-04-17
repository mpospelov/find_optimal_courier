module Api
  class UsersController < BaseController
    def show
      if current_user.present?
        render_object CurrentUserPresenter.new(current_user)
      else
        render_message('Need to login', UNAUTHORIZED)
      end
    end
  end
end
