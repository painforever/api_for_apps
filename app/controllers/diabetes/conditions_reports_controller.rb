class Diabetes::ConditionsReportsController < ApplicationController
  before_action :set_patient
  def create
  	condition = @patient.patient_reported_conditions.create(condition_params)
  	render_with_persist condition
  end

  def index
  end

  private
  def set_patient
  	@patient = Patient.find_by_patient_id(params[:patient_id])
  end

  def condition_params
  	params.require(:conditions_report).permit!
  end
end
