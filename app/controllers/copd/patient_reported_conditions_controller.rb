class Copd::PatientReportedConditionsController < ApplicationController
  def index
    render json: PatientReportedCondition.where(patient_id: params[:patient_id]), sattus: :ok
  end

  def create
    prc = PatientReportedCondition.new(prc_params)
    render_when_save prc
  end

  def prc_params
    params.require(:prc).permit!
  end
end
