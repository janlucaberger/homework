class UserMailer < ApplicationMailer
  default from: "test@gmail.com"

  def welcome_email(user)
    @user = user
    @url = 'http://cats.com'
    mail(to: @user.username, subject: "Welcome to 99 Cats")
  end

end
