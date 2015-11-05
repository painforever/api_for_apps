class Copd::ExcerbationsController < ApplicationController
  def index
    render json: Excerbation.where(patient_id: params[:patient_id]), status: 200
  end

  def create
    excerbation = Excerbation.new(excerbation_params)
    excerbation.disease_name = "COPD"
    render_when_save excerbation
  end

  def excerbation_params
    params.require(:excerbation).permit!
  end
end
