class AdminNotificationWorker
  include Sidekiq::Worker

  sidekiq_options queue: :notifier

  def perform(notification, email)
    AdminNotificationMailer.send(notification, email).deliver_now
  end
end
