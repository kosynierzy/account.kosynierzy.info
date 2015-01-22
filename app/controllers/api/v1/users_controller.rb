module Api
  module V1
    class UsersController < ApiController
      before_action :session_authorize!, except: [:index]

      respond_to :json

      def me
        render json: profile_representation
      end

      def sign_out
        current_session.try(:destroy)

        doorkeeper_token.destroy!

        head :no_content
      end

      def index
        use_case = begin
                     ListUsers.new(user: current_user)
                   rescue ActiveRecord::RecordNotFound
                     ListUsers.new(user: nil)
                   end

        render json: use_case.call
      end

      private

      def profile_representation
        ProfileRepresentation.new(current_user)
      end
    end
  end
end
