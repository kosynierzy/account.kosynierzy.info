module Api
  module V1
    class UsersController < ApiController
      before_action :doorkeeper_authorize!

      respond_to :json

      def me
        respond_with(current_resource_owner) do |format|
          format.json { render json: profile_representation.to_json }
        end
      end

      private

      def profile_representation
        ProfileRepresentation.new(current_resource_owner)
      end
    end
  end
end
