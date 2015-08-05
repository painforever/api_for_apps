class Medication < ActiveRecord::Base
  self.primary_key='drug_id'

  has_many :ndcs, foreign_key: 'drug_id'
end