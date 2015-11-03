class PatientTest < ActiveRecord::Base
  self.primary_key = 'test_instance_id'

  belongs_to :patient
end
