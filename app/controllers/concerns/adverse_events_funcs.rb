module AdverseEventsFuncs
  extend ActiveSupport::Concern
  include AuthenticatePatientsFuncs

  private
  def get_adverse_event_reports
    adverse_events = AdverseEventReporting.with_patient.with_medications.where(patient_id: @patient_id)
  end
end
