class PatientPrescriptionItem < ActiveRecord::Base
  self.primary_key = "prescription_item_id"

  mount_uploader :drug_photo, DrugPhotoUploader

  belongs_to :patient_prescription, foreign_key: :prescription_id
  belongs_to :medication, foreign_key: :drug_id

  #scopes
  scope :with_medications, -> {includes(:medication)}
end