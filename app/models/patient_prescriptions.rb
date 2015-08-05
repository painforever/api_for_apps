class PatientPrescription < ActiveRecord::Base
  self.primary_key = 'prescription_id'

  belongs_to :patient
  has_many :patient_prescription_items
end