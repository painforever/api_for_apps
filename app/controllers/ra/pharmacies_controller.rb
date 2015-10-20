class Ra::PharmaciesController < ApplicationController
  def index

  end

  def find_pharmacies
    return if params[:pharmacy_name].empty?
    @pharmacies = Pharmacy.where("prvd_other_organization_name LIKE ?", "#{params[:pharmacy_name]}%").limit(50)
    render json: @pharmacies, status: 200
  end
end
