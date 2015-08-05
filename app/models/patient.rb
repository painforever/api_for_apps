class Patient < ActiveRecord::Base
  has_one :user, foreign_key: 'patient_id'
  has_many :patient_prescriptions
  has_many :adverse_event_reportings
end