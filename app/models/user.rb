class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  self.primary_key='user_id'

  belongs_to :patient, foreign_key: 'patient_id'
  has_many :reminders
  #belongs_to :provider, foreign_key: 'provider_npi'
  validates :fname, :lname, :email_address, presence: true

  def self.authenticate(options={}) #email, password, temp_password
    user = User.find_by(email_address: options[:email])
    return nil unless user
    return user if user.password == options[:password] || user.temp_password == options[:password]
    nil
  end

  def self.generate_temp_password
    arr = ('a'..'z').to_a + ('0'..'9').to_a
    arr.sample(5).join
  end
end
