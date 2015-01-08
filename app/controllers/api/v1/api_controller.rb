module Api
  module V1
    class ApiController < ::ApplicationController
      def current_resource_owner
        User.find(doorkeeper_token.resource_owner_id)
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
