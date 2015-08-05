class MedicationsController < ApplicationController
  before_action :set_patient
  def index
    rx_ids = @patient.patient_prescriptions.pluck(:prescription_id)
    @medications = PatientPrescriptionItem.select("patient_prescription_items.* , medications.drug_name, patient_prescriptions.date_prescribed").
        from("patient_prescription_items, medications, patient_prescriptions").where(prescription_id: rx_ids).
        where("patient_prescription_items.drug_id = medications.drug_id AND
               patient_prescriptions.prescription_id = patient_prescription_items.prescription_id").order("patient_prescriptions.date_prescribed DESC")


    # rx_ids = @patient.patient_prescriptions.pluck(:prescription_id)
    # @medications = PatientPrescriptionItem.select("patient_prescription_items.* , ndc.PROPRIETARYNAME, patient_prescriptions.date_prescribed").
    #     from("patient_prescription_items, ndc, patient_prescriptions").where(prescription_id: rx_ids).
    #     where("patient_prescription_items.drug_id = ndc.drug_id AND
    #            patient_prescriptions.prescription_id = patient_prescription_items.prescription_id").order("patient_prescriptions.date_prescribed DESC").distinct
    render json: @medications, stauts: 200
  end

  def find_by_drug_name
    drug = Ndc.find_by(PROPRIETARYNAME: params[:drug_name])
    ra_render drug
  end

  private
  def set_patient
    @patient = Patient.find_by(patient_id: params[:patient_id]) if params.has_key? :patient_id
  end
end
