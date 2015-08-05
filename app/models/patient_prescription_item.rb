class PatientPrescriptionItem < ActiveRecord::Base
  self.primary_key = "prescription_item_id"

  belongs_to :patient_prescriptions, foreign_key: :prescription_id
end