class Ra::PharmaciesController < ApplicationController
  def index

  end

  def find_pharmacies
    @pharmacies = Pharmacy.where("prvd_other_organization_name LIKE ?", "#{params[:pharmacy_name]}%")
    puts @pharmacies.to_json
    render json: @pharmacies, status: 200
  end
end
