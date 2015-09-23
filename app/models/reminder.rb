class Reminder < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :reminder_name, presence: true
  validates :reminder_time, presence: true
  validates :repeat_times, presence: true

  scope :with_users, -> { includes(:user) }
end