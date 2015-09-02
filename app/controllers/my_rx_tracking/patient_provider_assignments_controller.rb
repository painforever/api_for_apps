class MyRxTracking::PatientProviderAssignmentsController < ApplicationController
  def create
    ppa = PatientProviderAssignment.new(patient_provider_assignment_params)
    render_when_save(ppa)
  end

  def patient_provider_assignment_params
    params.require(:patient_provider_assignment).permit!
  end
end
