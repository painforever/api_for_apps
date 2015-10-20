class UserMailer < ApplicationMailer
  default from: "terrorgeek@gmail.com"

  def send_mailer(user)
  	@user = user
  	@server_url = get_server_url
    @password = @user.password
  	mail(to: @user.email_address, subject: "Thank you for signup.")
  end

  def send_mailer_myrxtracking(user)
    send_mailer(user)
  end

  def change_password(user)
    @user = user
    @password = @user.password
    mail(to: @user.email_address, subject: "Your password has been changed.")
  end

  def temp_password(user)
    @user = user
    @password = @user.temp_password
    mail(to: @user.email_address, subject: "Your temp password has been assigned.")
  end

  def get_server_url
  	"http://localhost:3000/"
  end
end
