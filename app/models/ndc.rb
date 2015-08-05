class Ndc < ActiveRecord::Base
  self.primary_key='PRODUCTID'

  belongs_to :medication, foreign_key: :drug_id
end