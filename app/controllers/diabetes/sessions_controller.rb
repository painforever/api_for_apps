class Diabetes::SessionsController < AuthenticationsController
  def create
    login
  end
end
