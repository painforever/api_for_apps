class SessionsController < ApplicationController
	skip_before_filter :verify_authenticity_token
	respond_to :json
  def create
  	user = User.authenticate(params[:email], params[:password])
  	if user
  		respond_with user, status: 201
  	else
  		respond_with status: 500
  	end
  end

  def destroy
  end
end
