class Ra::AdverseEventReportingsController < ApplicationController
  def index
    @ads = AdverseEventReporting
               .select("DISTINCT(adverse_event_reporting.id), adverse_event_reporting.*, medications.drug_name, medications.drug_id, patient_prescription_items.*")
               .where(patient_id: params[:patient_id]).where("adverse_event_reporting.drug_id = medications.drug_id AND patient_prescription_items.drug_id = adverse_event_reporting.drug_id AND medications.drug_id = patient_prescription_items.drug_id")
               .from("adverse_event_reporting, medications, patient_prescription_items").order("adverse_event_reporting.created_at DESC")
    render json: @ads, status: 200
  end

  def show
    @ad = AdverseEventReporting.find_by_sql("SELECT DISTINCT(adverse_event_reporting.id), adverse_event_reporting.*, patient_prescription_items.* FROM
           adverse_event_reporting, patient_prescription_items WHERE
           adverse_event_reporting.drug_id = patient_prescription_items.drug_id AND adverse_event_reporting.id = '"+params[:id]+"'")[0]
    @rx = PatientPrescription.find_by(prescription_id: @ad.prescription_id)
    render json: [@ad, @rx], status: 200
  end

  def create
    @av = AdverseEventReporting.create!(av_params)
    render json: @av, status: 200
  end

  def av_params
    params.require(:adverse_event_reporting).permit!
  end
end
