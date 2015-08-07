class PatientPrescriptionsController < ApplicationController
  before_action :set_patient
  def create
    ActiveRecord::Base.transaction do
      begin
        rx = PatientPrescription.new(rx_params)
        rx.save!
        params[:patient_prescription_item][:prescription_id] = rx.prescription_id
        item = PatientPrescriptionItem.new(item_params)
        item.save!
        render json: "", status: 200
      rescue
        render json: "", status: 500 and return
      end
    end
    #render json: params, status: 200
  end

  def show
    @med = Medication.find(params[:id])
    if @med
      render json: @med, status: 200
    else
      render json: "", status: 500
    end
  end

  private
  def set_patient
    @patient = Patient.find_by(patient_id: params[:patient_id]) if params.has_key? :patient_id
  end

  def rx_params
    params.require(:patient_prescription).permit!
  end

  def item_params
    params.require(:patient_prescription_item).permit!
  end
end
