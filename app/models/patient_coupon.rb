class PatientCoupon < ActiveRecord::Base
  belongs_to :patient
  belongs_to :coupon
end
