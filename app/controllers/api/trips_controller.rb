module Api
  class TripsController < BaseController
    before_filter :authenticate_user!

    def index
      render_object(
        TripPresenter.for_collection.new(
          TripsQuery.new(current_user.trips, params).all))
    end

    def show
      render_object(TripPresenter.new(current_user.trips.find(params[:id])))
    end

    def create
      form = TripForm.new(Trip.new(user: current_user))

      if form.validate(params)
        form.save!
        render_object TripPresenter.new(form.model)
      else
        render_errors form.errors
      end
    end

    def update
      form = TripForm.new(current_user.trips.find(params[:id]))

      if form.validate(params)
        form.save!
        render_object TripPresenter.new(form.model)
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
