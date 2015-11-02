class Diabetes::SessionsController < ApplicationController
  def create
    render json: {sb: :ok, result: 200}, status: 200
  end
end
