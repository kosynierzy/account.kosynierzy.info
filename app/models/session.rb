class Session < ActiveRecord::Base
  EXPIRE_TIME = 60.minutes

  validates :user_id, presence: true

  belongs_to :user

  before_save :update_expires_at

  def alive?
    !expired?
  end

  def expired?
    expires_at < Time.current
  end

  def refresh!
    save!
  end

  private

  def update_expires_at
    self.expires_at = Time.current + EXPIRE_TIME
  end
end
