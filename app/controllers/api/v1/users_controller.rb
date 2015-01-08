module Api
  module V1
    class UsersController < ApiController
      before_action :doorkeeper_authorize!

      respond_to :json

      def me
        render json: profile_representation
      end

      def index
        use_case = ListUsers.new(user_id: current_resource_owner_id)
        render json: use_case.call
      end

      private

      def profile_representation
        ProfileRepresentation.new(current_resource_owner)
      end
    end
  end
end
