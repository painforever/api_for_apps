class User < ActiveRecord::Base
  self.primary_key='user_id'

  belongs_to :patient, foreign_key: 'patient_id'
  belongs_to :provider, foreign_key: 'provider_npi'
  validates :fname, :lname, :email_address, presence: true
end