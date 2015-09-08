class Medication < ActiveRecord::Base
  self.primary_key='drug_id'

  has_many :ndcs, foreign_key: :drug_id
  has_many :adverse_event_reportings, foreign_key: :drug_id
  has_many :patient_prescription_items, foreign_key: :drug_id
  has_many :patient_reported_medications, foreign_key: :drug_id
end