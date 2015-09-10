class MyRxTracking::RxsController < ApplicationController
  include RxsFuncs

  def index
    #proc to construct the drug
    drug_proc = Proc.new {|name, rx_id, is_finished, notes| {drug_name: name, rx_id: rx_id, is_finished: is_finished, notes: notes} }
    rx_drugs = get_patient_rxs
    res_drugs = []
    rx_drugs.each do |drug|
      res_drugs.push drug_proc.call(drug.medication.drug_name, drug.prescription_id, drug.is_finished, drug.patient_prescription.notes)
    end
    render_proc_200.call(res_drugs)
  end
end
