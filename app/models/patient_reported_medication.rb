class PatientReportedMedication < ActiveRecord::Base
  belongs_to :patient
  belongs_to :medication, foreign_key: :drug_id

  #scopes
  scope :with_medications, -> { includes(:medication) }
  scope :with_patients, -> {includes(:patient)}
end