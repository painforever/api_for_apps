class SessionsController < ApplicationController
  respond_to :json, :xml
  def create
  	user = User.authenticate(params[:email], params[:password])
  	if user
  		respond_with user, status: :created
  	else
  		respond_with {}, status: 500
  	end
  end

  def destroy
  end
end
