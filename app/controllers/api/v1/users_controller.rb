module Api
  module V1
    class UsersController < ApiController
      doorkeeper_for :all

      respond_to :json

      def me
        respond_with(current_resource_owner)
      end
    end
  end
end
