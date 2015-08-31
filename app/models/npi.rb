class Npi < ActiveRecord::Base
  self.table_name = 'npi'
  self.primary_key = 'NPI'

  has_many :patient_provider_assignments, foreign_key: :provider_npi
  has_many :patients, through: :patient_provider_assignments

  def full_name
    self.prvd_First_Name.to_s + " " + self.prvd_Last_Name_Legal_Name.to_s
  end
end