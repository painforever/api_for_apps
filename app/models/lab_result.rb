class LabResult < ActiveRecord::Base
  self.table_name = 'tests'
  self.primary_key = 'loinc_num'
end
