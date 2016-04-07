module Api
  class TripsController < BaseController
    before_filter :authenticate_user!

    def index
      render_object(TripPresenter.for_collection.new(current_user.trips))
    end
  end
end
