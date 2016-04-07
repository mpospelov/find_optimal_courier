module Api
  class BaseController < ApplicationController
    UNRESPONSIBLE_ENTITY = 422
    UNAUTHORIZED = 401
    HTTP_OK = 200

    protected

    def render_object(object, status = HTTP_OK)
      render json: object, status: status
    end

    def render_errors(errors, status = UNRESPONSIBLE_ENTITY)
      render json: errors, status: status
    end

    def render_message(message, status = HTTP_OK)
      render json: { message: message }, status: status
    end

    def api_authenticate_user!
      render_message('Needs to login', UNAUTHORIZED) unless user_signed_in?
    end
  end
end
