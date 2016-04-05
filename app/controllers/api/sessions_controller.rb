module Api
  class SessionsController < BaseController
    def create
      form = SessionForm.new(user)
      if form.validate(params)
        sign_in(form.model)
        render_object(
          CurrentUserPresenter.new(form.model).to_hash(previous_url: session[:previous_url]))
      else
        render_errors form.errors
      end
    end

    def destroy
      sign_out
      render_message 'Signed out successfully.'
    end

    private

    def user
      @user ||= UserByEmailQuery.new(params[:email]).take
    end

    def login_field
      @login_field ||= LoginField.new(params.fetch(:login_field))
    end
  end
end
