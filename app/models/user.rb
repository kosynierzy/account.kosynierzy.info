class User < ActiveRecord::Base
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

  protected

  def after_confirmation
    Backburner.enqueue(AdminNotificationWorker, 'user_confirmed', email)
  end
end
