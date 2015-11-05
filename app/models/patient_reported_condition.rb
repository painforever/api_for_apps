class PatientReportedCondition < ActiveRecord::Base
  belongs_to :patient
end
