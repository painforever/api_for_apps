class PatientPrescriptionItem < ActiveRecord::Base
  self.primary_key = "prescription_item_id"

  mount_uploader :drug_photo, DrugPhotoUploader

  belongs_to :patient_prescription, foreign_key: :prescription_id
  belongs_to :medication, foreign_key: :drug_id
  has_one :patient_prescription_use, foreign_key: :prescription_instance_id

  #scopes
  scope :with_medications, -> {includes(:medication)}
  scope :with_rxs, -> {includes(:patient_prescription)}
end