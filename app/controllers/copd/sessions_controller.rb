class Copd::SessionsController < ApplicationController
  def create
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      render json: user, status: 201
    else
      render json: nil, status: 500
    end
  end
end
