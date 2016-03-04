module PatientFuncs
  private
  def set_patient
  	@patient = Patient.find_by_patient_id(params[:patient_id])
  end
end