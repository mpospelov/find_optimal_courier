module Api
  module Admin
    class BaseController < ::Api::BaseController
      before_action :api_authenticate_user!

      def api_authenticate_admin!
        render_message('You do not have permissions', PERMISSION_DENIED) unless current_user.admin?
      end

      def api_authenticate_manager!
        render_message('You do not have permissions', PERMISSION_DENIED) unless current_user.manager?
      end
    end
  end
end
