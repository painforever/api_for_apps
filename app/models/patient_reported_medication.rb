class PatientReportedMedication < ActiveRecord::Base
  belongs_to :patient
  belongs_to :medication, foreign_key: :drug_id
end