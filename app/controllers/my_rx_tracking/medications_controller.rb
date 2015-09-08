class MyRxTracking::MedicationsController < ApplicationController
  def index
    #get both Rx drugs and self-added drugs
    patient_id = params[:patient_id].strip.chomp
    rx_ids = PatientPrescription.where(patient_id: patient_id).pluck(:prescription_id)
    rx_drugs = PatientPrescriptionItem.joins(:medication).select('patient_prescription_items.*, medications.drug_name').where(prescription_id: rx_ids)
    added_drugs = PatientReportedMedication.joins(:medication).where(patient_id: patient_id)
    all_drugs ||= []
    rx_drugs.each do |rx_drug|
      drug = OpenStruct.new
      drug.drug_name = rx_drug.drug_name
      all_drugs.push(drug)
    end

    render_proc_200.call(all_drugs)
  end

end
