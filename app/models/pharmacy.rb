class Pharmacy < ActiveRecord::Base
  self.table_name = "pharmacy"
  self.primary_key = "pharmacy_npi"
end