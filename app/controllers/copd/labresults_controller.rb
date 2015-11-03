class Copd::LabresultsController < ApplicationController
  before_action :set_patient
  def create
    patient_test = PatientTest.new(patient_tests_params)
    render_when_save patient_test
  end

  def index
    render_proc_200.call PatientTest.where(patient_id: params[:patient_id])
  end

  def patient_tests_params
    params.require(:patient_test).permit!
  end

  private
  def set_patient
    not_found unless params.has_key? :patient_id
  end
end
