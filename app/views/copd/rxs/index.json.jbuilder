##for rxs drugs
# json.array! @rx_drugs do |drug|
#   json.drug_name drug.medication.drug_name
#   json.rx_id drug.prescription_id
#   json.is_finished drug.is_finished
#   json.notes drug.patient_prescription.notes
#   json.dosage drug.dosage
# end

json.array! @added_drugs do |drug|
  json.drug_name drug.medication.drug_name
  json.prescribed_date drug.prescribed_date
  json.end_date drug.end_date
  json.route_name drug.route_name
  json.dosage drug.dosage
end
