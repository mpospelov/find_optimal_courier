module Api
  class BaseController < ApplicationController
    UNRESPONSIBLE_ENTITY = 422
    UNAUTHORIZED = 401
    PERMISSION_DENIED = 403
    HTTP_OK = 200
    NOT_FOUND = 404

    rescue_from AuthenticationError do
      render_message(I18n.t('login_error'), UNAUTHORIZED)
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      Rails.logger.debug e.inspect
      render_message(I18n.t('not_found'), NOT_FOUND)
    end

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
      render_message(I18n.t('login_error'), UNAUTHORIZED) unless user_signed_in?
    end
  end
end
