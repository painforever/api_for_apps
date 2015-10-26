class MyRxTracking::CouponsController < ApplicationController
  def index
    #list all coupons for a single patients
    coupons = current_patient.coupons
    render json: coupons
  end

  def show
    #show a single coupon
    render json: Coupon.find(params[:id])
  end
end
