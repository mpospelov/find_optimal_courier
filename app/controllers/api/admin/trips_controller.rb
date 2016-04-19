module Api
  module Admin
    class TripsController < ::Api::BaseController
      before_action :api_authenticate_manager!
    end
  end
end
