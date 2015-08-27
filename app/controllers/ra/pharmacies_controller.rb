class Ra::PharmaciesController < ApplicationController
  def index

  end

  def find_pharmacies
    @pharmacies = Pharmacy.where("pharmacy_name LIKE ?", "%#{params[:pharmacy_name]}%")
    render json: @pharmacies, status: 200
  end
end
