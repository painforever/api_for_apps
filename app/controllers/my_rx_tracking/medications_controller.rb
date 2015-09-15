class MyRxTracking::MedicationsController < ApplicationController
  include RxsFuncs

  def index
    #proc to construct the drug
    drug_proc = Proc.new {|name, dosage, date, type| {drug_name: name, dosage: dosage, date: date, type: type} }
    #get both Rx drugs and self-added drugs
    rx_drugs = get_patient_rxs
    added_drugs = get_added_drugs
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

  def upload_drug_photo
    item = PatientReportedMedication.find(params[:id])
    item.photo = params[:drug_photo]
    item.save
    render nothing: true
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
    render_obj_with_200(drug)
  end

end
