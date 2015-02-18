class AdminNotificationMailer < ActionMailer::Base
  default from: ENVied.SMTP_FROM

  def user_confirmed(email)
    @user = User.find_by(email: email)

    mail(to: ENVied.ADMIN_EMAIL, subject: '[Kosynierzy] New account created')
  end
end
