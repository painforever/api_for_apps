class Copd::AdverseEventReportingsController < ApplicationController
  include AdverseEventsFuncs
  include RxsFuncs

  respond_to :json, :html

  def index
    @adverse_events = get_adverse_event_reports
  end

  def create
    ae = AdverseEventReporting.new(as_params)
    drug = search_drug_in_med_and_ndc(params[:drug_name])
    unless drug
      render status: 500, json: '' and return
    else
      ae[:drug_id] = drug.drug_id
      render_when_save ae
    end
  end

  def as_params
    params.require(:ae).permit!
  end
end
