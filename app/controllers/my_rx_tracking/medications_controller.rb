class MyRxTracking::MedicationsController < ApplicationController
  def index
    #proc to construct the drug
    drug_proc = Proc.new {|name, dosage, date, type| {drug_name: name, dosage: dosage, date: date, type: type} }
    #get both Rx drugs and self-added drugs
    bad_request(params) if !params.has_key? :patient_id
    patient_id = params[:patient_id].strip.chomp
    rx_ids = PatientPrescription.where(patient_id: patient_id).pluck(:prescription_id)
    rx_drugs = PatientPrescriptionItem.with_rxs.with_medications.where(prescription_id: rx_ids)
    added_drugs = PatientReportedMedication.with_medications.where(patient_id: patient_id)
    all_drugs ||= []
    rx_drugs.each do |rx_drug|
      drug = drug_proc.call rx_drug.medication.drug_name, rx_drug.dosage, rx_drug.patient_prescription.date_prescribed, 'rx'
      all_drugs.push drug
    end
    added_drugs.each do |added_drug|
      drug = drug_proc.call added_drug.medication.drug_name, added_drug.dosage, added_drug.prescribed_date, 'added'
      all_drugs.push drug
    end
    render_proc_200.call(all_drugs)
  end

  def create
    prm = PatientReportedMedication.new(prm_params)
    render_when_save(prm)
  end

  def prm_params
    params.require(:prm).permit!
  end

  def search_drug
    drug = Medication.find_by(drug_name: params[:drug_name])
    render_obj(drug)
  end

end
