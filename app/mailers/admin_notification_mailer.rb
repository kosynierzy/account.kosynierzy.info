class AdminNotificationMailer < ActionMailer::Base
  default from: Figaro.env.smtp_from

  def user_confirmed(email)
    @user = User.find_by(email: email)

    mail(to: Figaro.env.admin_email, subject: '[Kosynierzy] New account created')
  end
end
