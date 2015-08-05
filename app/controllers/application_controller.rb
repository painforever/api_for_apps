class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :auth_token

  def auth_token
    if !params.has_key? :token
      render status: 500 and return false
    end
  end
end
