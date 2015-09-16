class PatientPrescriptionUse < ActiveRecord::Base
  self.table_name = "patient_prescription_use"

  belongs_to :patient_prescription_item, foreign_key: :prescription_instance_id
end