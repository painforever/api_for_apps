module AuthenticatePatientsFuncs
  extend ActiveSupport::Concern

  included do
    before_action :check_bad_request
  end

  def check_bad_request
    bad_request(params) if !params.has_key? :patient_id
    set_patient_id
  end

  def set_patient_id
    @patient_id = params[:patient_id].strip.chomp
  end
end
