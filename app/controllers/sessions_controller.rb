class SessionsController < Devise::SessionsController
  def destroy
    Doorkeeper::AccessToken.where(resource_owner_id: current_user.id).destroy_all

    super
  end
end
