class Diabetes::MedicationsController < ApplicationController
  def index
  	drugs = PatientReportedMedication.with_medications.where(patient_id: params[:patient_id])
  	render json: drugs, status: :ok
  end
end
