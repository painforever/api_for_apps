class Patient < ActiveRecord::Base
  has_one :user, foreign_key: 'patient_id'
  has_many :patient_prescriptionses
end