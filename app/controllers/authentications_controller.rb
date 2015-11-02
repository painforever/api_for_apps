class AuthenticationsController < ApplicationController
  def login
  	user = User.authenticate(email: params[:email], password: params[:password])
		#UserMailer.send_mailer(user).deliver_now
  	if user
			render json: user, status: 201
  	else
  		render json: "", status: 500
  	end
  end
end
