class Excerbation < ActiveRecord::Base
  self.table_name = "prescriptions"
  belongs_to :patient
end
