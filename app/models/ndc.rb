class Ndc < ActiveRecord::Base
  self.table_name = 'ndc'
  self.primary_key='PRODUCTID'

  belongs_to :medication, foreign_key: :drug_id
end