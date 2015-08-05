class AdverseEventReporting < ActiveRecord::Base
  self.table_name = "adverse_event_reporting"

  belongs_to :patient
  belongs_to :medication , foreign_key: :drug_id
end