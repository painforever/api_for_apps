class PatientProviderAssignment < ActiveRecord::Base
  belongs_to :npi, foreign_key: :provider_npi
  belongs_to :patient, foreign_key: :patient_id
end