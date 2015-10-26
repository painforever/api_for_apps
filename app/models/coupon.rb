class Coupon < ActiveRecord::Base
  has_many :patient_coupons
  has_many :patients, through: :patient_coupons
end
