class PatientPrescription < ActiveRecord::Base
  self.primary_key = 'prescription_id'

  belongs_to :patient
  has_many :patient_prescription_items, foreign_key: :prescription_id

  #scopes
  scope :with_rx_items, -> { includes(:patient_prescription_items)}
end