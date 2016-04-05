module Api
  class BaseController < ApplicationController

    protected

    def render_object(object, status = 200)
      render json: object, status: status
    end

    def render_errors(errors, status = 400)
      render json: errors, status: status
    end
  end
end
