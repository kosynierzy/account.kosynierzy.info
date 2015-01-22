module Api
  module V1
    class UsersController < ApiController
      before_action :authorize!, except: [:index]
      before_action :doorkeeper_authorize!, only: [:index]

      respond_to :json

      def me
        render json: profile_representation
      end

      def sign_out
        current_session.try(:destroy)

        doorkeeper_token.destroy!

        head :ok
      end

      def index
        use_case = ListUsers.new(user: current_user)
        render json: use_case.call
      rescue ActiveRecord::RecordNotFound
        use_case = ListUsers.new(user: nil)
        render json: use_case.call
      end

      private

      def profile_representation
        ProfileRepresentation.new(current_user)
      end
    end
  end
end
