json.array! @adverse_events do |ae|
  json.ae ae
  json.medication ae.medication
  json.patient ae.patient
end
