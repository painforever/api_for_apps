module RxsFuncs
  extend ActiveSupport::Concern

  def search_drug
    drug = Medication.find_by(drug_name: params[:drug_name])
    render_obj_with_200(drug)
  end

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
    added_drugs = PatientReportedMedication.with_medications.where(patient_id: @patient_id).order(:prescribed_date)
  end

  def create_selfadd_drug
    prm = PatientReportedMedication.new(prm_params)
    render_when_save(prm)
  end

  def search_drug_in_med_and_ndc(drug_name = '')
    drug = Medication.find_by(drug_name: drug_name)
    unless drug
      drug = Ndc.where(PROPRIETARYNAME: drug_name).where.not(drug_id: nil).first
    end
    drug
  end

  def set_patient_id
    @patient_id = params[:patient_id].strip.chomp
  end

  def prm_params
    params.require(:prm).permit!
  end
end
