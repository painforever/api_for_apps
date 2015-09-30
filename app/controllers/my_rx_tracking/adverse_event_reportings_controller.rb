class MyRxTracking::AdverseEventReportingsController < ApplicationController
  def create
    aer = AdverseEventReporting.new(aer_params)
    render_when_save aer
  end

  def aer_params
    params.require(:adverse_event_reporting).permit!
  end
end
