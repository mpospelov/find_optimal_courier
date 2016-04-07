module Api
  class RegistrationsController < BaseController
    def create
      form = RegistrationForm.new(User.new)
      if form.validate(params)
        form.save!
        sign_in(form.model)
        render_object(
          CurrentUserPresenter.new(form.model).to_hash(previous_url: session[:previous_url]))
      else
        render_errors(form.errors)
      end
    end
  end
end
