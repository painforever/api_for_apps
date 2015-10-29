class Copd::AdverseEventReportingsController < ApplicationController
  include AdverseEventsFuncs
  respond_to :json, :html
  
  def index
    @adverse_events = get_adverse_event_reports
    respond_with @adverse_events
  end
end
