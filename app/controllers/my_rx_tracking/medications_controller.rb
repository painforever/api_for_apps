class MyRxTracking::MedicationsController < ApplicationController
  include RxsFuncs

  def index
    #proc to construct the drug
    drug_proc = Proc.new {|name, dosage, date, type, time_of_day, days_of_treatment, remote_drug_photo_url| {drug_name: name,
                                                                                                             dosage: dosage, date: date,
                                                                                                             type: type, time_of_day: time_of_day,
                                                                                                             days_of_treatment: days_of_treatment, remote_drug_photo_url: remote_drug_photo_url} }
    #get both Rx drugs and self-added drugs
    rx_drugs = get_patient_rxs
    added_drugs = get_added_drugs
    all_drugs ||= []

    added_drugs.each do |added_drug|
      drug = drug_proc.call added_drug.medication.drug_name, added_drug.dosage, added_drug.prescribed_date, 'added', '', '', added_drug.remote_drug_photo_url
      all_drugs.push drug
    end

    rx_drugs.each do |rx_drug|
      drug = drug_proc.call rx_drug.medication.drug_name, rx_drug.dosage, rx_drug.patient_prescription.date_prescribed, 'rx', rx_drug.time_of_day, rx_drug.days_of_treatment
      drug[:rx_item_id] = rx_drug.prescription_item_id
      all_drugs.push drug
    end

    render_proc_200.call(all_drugs)
  end

  def upload_drug_photo
    update_drug_photo('photo')
  end

  def update_drug_remote_url
    update_drug_photo('remote_drug_photo_url')
  end

  def create
    prm = PatientReportedMedication.new(prm_params)
    render_when_save(prm)
  end

  def take_drug
    item = PatientPrescriptionItem.find_by(prescription_item_id: params[:rx_item_id])
    drug = Medication.find_by(drug_id: item.drug_id)
    use = item.patient_prescription_use
    if use
      use.usage_count += 1
      use.save
      remain = item.days_of_treatment * item.times_per_day - use.usage_count
      if remain == 0
        render status: 200, json: {msg: 'Good job, you have finished taking '+drug.drug_name+'!', finished: 'yes'}
      else
        render status: 200, json: {msg: 'Success! You have '+remain.to_s+' times left!', finished: 'no'}
      end
    else
      item.create_patient_prescription_use(usage_count: 1, days: item.days_of_treatment, patient_id: params[:patient_id])
      render status: 200, json: {msg: 'Success! You have '+(item.days_of_treatment * item.times_per_day - 1).to_s+' times left!', finished: 'no'}
    end
  end

  def prm_params
    params.require(:prm).permit!
  end

  def search_drug
    drug = Medication.find_by(drug_name: params[:drug_name])
    render_obj_with_200(drug)
  end

  def async_search_drug
    base_url = 'http://www.goodrx.com/'

    drug = params[:drug].to_s.downcase
    require 'open-uri'
    begin
      html = Nokogiri::HTML(open(base_url+drug))
      res = html.xpath("//img").first.attributes["src"].value.to_s
      render_obj_with_200(res)
    rescue
      render status: 200, json: 'drug not found'
    end
  end

  private
  def update_drug_photo(column)
    item = PatientReportedMedication.find(params[:id])
    item.send("#{column}=", params[:drug_photo])
    item.save
    render nothing: true
  end

end
