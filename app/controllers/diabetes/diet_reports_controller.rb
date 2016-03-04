class Diabetes::DietReportsController < ApplicationController
  include PatientFuncs

  def index
  	@diet_logs = PatientDietaryLog.where(patient_id: @patient.patient_id)
  	render json: @diet_logs, status: :ok
  end

  def create
  end
end
