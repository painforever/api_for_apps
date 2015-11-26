class Diabetes::LabsController < ApplicationController
  def index
    render json: PatientTest.where(patient_id: params[:patient_id]), status: :ok
  end

  def create
  end
end
