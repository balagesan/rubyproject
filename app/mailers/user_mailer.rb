# usermailer
class UserMailer < ActionMailer::Base
  default from: 'alagesbalan@gmail.com'

  def registration_confirmation(user)
    @user = user
    mail(to: "#{@user.username}<#{@user.email}>", subject: 'Confirm register')
  end
end
