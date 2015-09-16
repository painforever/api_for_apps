module RxsFuncs
  extend ActiveSupport::Concern

  private
  def check_bad_request
    bad_request(params) if !params.has_key? :patient_id
    set_patient_id
  end

  def get_patient_rxs
    check_bad_request
    rx_ids = PatientPrescription.where(patient_id: @patient_id).pluck(:prescription_id)
    rx_drugs = PatientPrescriptionItem.with_rxs.with_medications.where(prescription_id: rx_ids, is_finished: 'no')
  end

  def get_added_drugs
    check_bad_request
    added_drugs = PatientReportedMedication.with_medications.where(patient_id: @patient_id)
  end

  def set_patient_id
    @patient_id = params[:patient_id].strip.chomp
  end
end