module Api
  module V1
    class UsersController < ApiController
      before_action :doorkeeper_authorize!
      before_action :restricted_access!, only: :index

      respond_to :json

      def me
        render json: profile_representation
      end

      def index
        render json: users_list_representation
      end

      private

      def profile_representation
        ProfileRepresentation.new(current_resource_owner)
      end

      def users_list_representation
        users = User.select(:id, :username).order(:username)
        UsersListRepresentation.for_collection.represent(users)
      end

      def restricted_access!
        unless current_resource_owner.kosynierzy?
          head :forbidden
        end
      end
    end
  end
end
