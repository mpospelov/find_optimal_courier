module Api
  module Admin
    class BaseController < ::Api::BaseController
      before_action :api_authenticate_user!

      def api_authenticate_admin!
        return if current_user.admin?
        render_message('You do not have permissions', PERMISSION_DENIED)
      end

      def api_authenticate_manager!
        return if current_user.manager? || current_user.admin?
        render_message('You do not have permissions', PERMISSION_DENIED)
      end
    end
  end
end
