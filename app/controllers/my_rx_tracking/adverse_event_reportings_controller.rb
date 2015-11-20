class MyRxTracking::AdverseEventReportingsController < ApplicationController
  def create
    aer = AdverseEventReporting.new(aer_params)
    render_when_save aer
  end

  def aer_params
    params.require(:adverse_event_reporting).permit!
  end
 
  def upload_photo
  	item = AdverseEventReporting.find(params[:id])
    item.photo = params[:photo]
    item.save
    render nothing: true
  end
end