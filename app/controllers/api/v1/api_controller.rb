module Api
  module V1
    class ApiController < ::ActionController::Base
      before_action :doorkeeper_authorize!

      def session_authorize!
        if current_session.try(:alive?)
          current_session.refresh!
        else
          current_session.try(:destroy)

          head 401
        end
      end

      def current_session
        return unless doorkeeper_token

        @current_session ||= Session.find_by(id: current_resource_owner_id)
      end

      def current_user
        User.find(current_session.try(:user_id))
      end

      def current_application
        doorkeeper_token.application
      end

      def current_resource_owner_id
        doorkeeper_token.resource_owner_id
      end
    end
  end
end
