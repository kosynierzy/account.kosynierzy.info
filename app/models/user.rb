class User < ActiveRecord::Base
  include Gravtastic

  devise :async,
         :confirmable,
         :database_authenticatable,
         :lockable,
         :recoverable,
         :registerable,
         :trackable,
         :validatable

  validates :username, presence: true, uniqueness: true

  has_gravatar

  def admin?
    roles.include?('admin')
  end

  def kosynierzy?
    roles.include?('kosynierzy')
  end

  protected

  def after_confirmation
    AdminNotificationWorker.perform_async('user_confirmed', email)
  end
end
