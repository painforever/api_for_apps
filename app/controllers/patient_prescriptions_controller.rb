class PatientPrescriptionsController < ApplicationController
  before_action :set_patient
  def create
    # rx = PatientPrescription.new(rx_params)
    # item = PatientPrescriptionItem.new(item_params)
    # ActiveRecord::Base.transaction do
    #   if rx.save! and item.save!
    #     render status: 500
    #   else
    #     render status: 200
    #   end
    # end
    puts params
    render json: params, status: 200
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
