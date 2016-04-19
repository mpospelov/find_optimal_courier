module Api
  module Admin
    class UsersController < Api::Admin::BaseController
      before_action :api_authenticate_manager!

      def index
        render_object(AdminUserPresenter.for_collection.new(User.all))
      end

      def show
        render_object(AdminUserPresenter.new(User.find(params[:id])))
      end

      def create
        form = AdminUserForm.new(User.new)

        if form.validate(params)
          form.save!
          render_object AdminUserPresenter.new(form.model)
        else
          render_errors form.errors
        end
      end

      def update
        form = AdminUserForm.new(User.find(params[:id]))

        if form.validate(params)
          form.save!
          render_object AdminUserPresenter.new(form.model)
        else
          render_errors form.errors
        end
      end

      def destroy
        User.destroy(params[:id])
        render_message 'Successfully deleted'
      end
    end
  end
end
