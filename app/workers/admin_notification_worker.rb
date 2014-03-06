class AdminNotificationWorker
  include Backburner::Queue

  queue "notifier"

  def self.perform(notification, email)
    AdminNotificationMailer.send(notification, email).deliver
  end
end
