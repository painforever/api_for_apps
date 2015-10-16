class Ra::PharmaciesController < ApplicationController
  def index

  end

  def find_pharmacies
    return if params[:pharmacy_name].empty?
    @pharmacies = Pharmacy.where("prvd_other_organization_name LIKE ?", "#{params[:pharmacy_name]}%").limit(50)
    # @pharmacies.reject {|ph|
    #   address = ph.prvd_First_Line_Business_Practice_loc_addr+" "+ph.prvd_Business_Practice_loc_addr_City_Name+" "+ph.prvd_Business_Practice_loc_addr_State_Name+" "+ph.prvd_Business_Practice_loc_addr_Postal_Code
    #   ph_geokit_location = Geokit::Geocoders::GoogleGeocoder.geocode address
    #   ph_lat = ph_geokit_location.latitude
    #   ph_long = ph_geokit_location.longitude
    #   if ph_lat && ph_long
    #     my_location = Geokit::Geocoders::GoogleGeocoder.reverse_geocode([params[:latitude], params[:longitude]])
    #     distance = my_location.distance_to(ph_geokit_location)
    #     distance < 10
    #   end
    #   false
    # }
    #puts @pharmacies.to_json
    render json: @pharmacies, status: 200
  end
end
