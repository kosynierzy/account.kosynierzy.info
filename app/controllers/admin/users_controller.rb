module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :restricted_access!

    def index
      @users = User.order(:username)
    end

    private

    def restricted_access!
      unless current_user.roles.include?('gtw')
        flash[:alert] = t('flash.access_denied')
        redirect_to root_path
      end
    end
  end
end
