class MyRxTracking::PatientProviderAssignmentsController < ApplicationController
  def create
    ppa = PatientProviderAssignment.new(patient_provider_assignment_params)
    ppa.date_assigned = Time.now
    render_when_save(ppa)
  end

  def index
    patient = Patient.find(params[:patient_id])
    npis = patient.npis
    render json: npis, status: 200
  end

  def can_add
    res = PatientProviderAssignment.where(patient_id: params[:patient_id], provider_npi: params[:provider_npi])
    render_obj_with_200(res)
  end

  def patient_provider_assignment_params
    params.require(:patient_provider_assignment).permit!
  end
end
