class Ra::SessionsController < ApplicationController
	skip_before_filter :verify_authenticity_token
	respond_to :json
  def create
  	user = User.authenticate(params[:email], params[:password])
		#UserMailer.send_mailer(user).deliver_now
  	if user
			render json: user, status: 201
  	else
  		render json: "", status: 500
  	end
  end

  def destroy
  end
end
