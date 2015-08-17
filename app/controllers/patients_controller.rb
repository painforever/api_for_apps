class PatientsController < ApplicationController
  def joint_report
    ppu=PatientPrescriptionUse.new(hurt_position: params[:part], patient_id: params[:patient_id],
                                  tender: params[:tender], swollen: params[:swollen], pain: params[:pain])
    if ppu.save
      ra_render(ppu)
    else
      render status: 500
    end
  end
end
