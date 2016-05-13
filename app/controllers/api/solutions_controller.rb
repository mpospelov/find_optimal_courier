module Api
  class SolutionsController < BaseController
    before_filter :authenticate_user!

    def create
      form = SolutionForm.new(Solution.new(user: current_user))
      if form.validate(params)
        form.save!
        render_object SolutionPresenter.new(form.model)
      else
        render_errors form.errors
      end
    end

    def show
      render_object SolutionPresenter.new(current_user.solutions.find(params[:id]))
    end

    def index
      solutions = current_user.solutions
      render_object SolutionPresenter.for_collection.new(solutions)
    end
  end
end
