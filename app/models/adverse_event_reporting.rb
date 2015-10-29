class AdverseEventReporting < ActiveRecord::Base
  self.table_name = "adverse_event_reporting"

  belongs_to :patient
  belongs_to :medication , foreign_key: :drug_id

  scope :with_patient, -> {includes(:patient)}
  scope :with_medications, -> {includes(:medication)}
end
