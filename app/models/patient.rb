class Patient < ActiveRecord::Base
  has_one :user, foreign_key: 'patient_id'
  has_many :patient_prescriptions
  has_many :adverse_event_reportings
  has_many :patient_provider_assignments
  has_many :npis, through: :patient_provider_assignments
  has_many :patient_reported_medications
  has_many :insurance_members
  has_many :patient_tests
  has_many :patient_reported_conditions
  #Coupon
  has_many :patient_coupons
  has_many :coupons, through: :patient_coupons

  scope :with_user, -> {includes(:user)}
end
