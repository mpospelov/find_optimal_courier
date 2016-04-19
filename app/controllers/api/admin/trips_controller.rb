module Api
  module Admin
    class TripsController < ::Api::Admin::BaseController
      before_action :api_authenticate_admin!

      def index
        render_object(
          AdminTripPresenter.for_collection.new(
            Trip.includes(:user).order(created_at: :desc)))
      end

      def show
        render_object(AdminTripPresenter.new(Trip.find(params[:id])))
      end

      def create
        form = AdminTripForm.new(Trip.new)

        if form.validate(params)
          form.save!
          render_object AdminTripPresenter.new(form.model)
        else
          render_errors form.errors
        end
      end

      def update
        form = AdminTripForm.new(Trip.find(params[:id]))

        if form.validate(params)
          form.save!
          render_object AdminTripPresenter.new(form.model)
        else
          render_errors form.errors
        end
      end

      def destroy
        Trip.destroy(params[:id])
        render_message 'Successfully deleted'
      end
    end
  end
end
