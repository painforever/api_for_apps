class MyRxTracking::NpisController < ApplicationController
  def search_doctor
    input = params[:input].to_s.strip
    fname, lname = input.split(' ')
    npis = Npi.where("prvd_First_Name LIKE ? OR prvd_Last_Name_Legal_Name LIKE ?", "%#{fname}", "%#{lname}").limit(100)
    render status: 200, json: npis
  end
end
