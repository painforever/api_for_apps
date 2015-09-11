class MyRxTracking::ProfilesController < ApplicationController
  def index
    patient_id = params[:patient_id]
    patient = Patient.with_user.find_by(patient_id: patient_id)
    contact_info = patient.user

    render json: {contact_info: contact_info, insurance_info: ''}
  end

  def update
    user_id = params[:id]
    user = User.find(user_id)
    if user.password != params[:user][:old_password]
      render status: 401, json: 'Password is not correct!'
    else
      if user.update(user_params)
        render status: :ok, json: user
      else
        render status: 500, json: ''
      end
    end
  end

  def user_params
    params.require(:user).permit(:email_address, :cell_phone_number, :password)
  end
end