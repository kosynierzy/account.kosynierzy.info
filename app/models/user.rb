class User < ActiveRecord::Base
  include Gravtastic

  devise :async,
         :confirmable,
         :database_authenticatable,
         :lockable,
         :recoverable,
         :registerable,
         :rememberable,
         :timeoutable,
         :trackable,
         :validatable

  validates :username, presence: true, uniqueness: true

  has_gravatar

  protected

  def after_confirmation
    AdminNotificationWorker.perform_async('user_confirmed', email)
  end
end
