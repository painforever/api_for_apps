class InsuranceMember < ActiveRecord::Base
  belongs_to :insurance_plan
  belongs_to :patient

  scope :with_plan, -> { includes(:insurance_plan) }
end