class InsurancePlan < ActiveRecord::Base
  has_many :insurance_members
end