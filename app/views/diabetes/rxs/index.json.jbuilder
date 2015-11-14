json.array! @drugs do |drug|
  json.drug_name drug.medication.drug_name
  json.prescribed_date drug.prescribed_date
  json.end_date drug.end_date
  json.route_name drug.route_name
  json.dosage drug.dosage
end