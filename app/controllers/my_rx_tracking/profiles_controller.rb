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
      render_by_boolean user.update(user_params), user
    end
  end

  def update_profile
    user = User.find(params[:user_id])
    flag = user.update(user_params)
    render_by_boolean flag, user
  end

  # def upload_avatar
  #   user = User.find(params[:user_id])
  #   user.avatar = params[:avatar]
  #   user.save
  #   render nothing: true
  # end

  def user_params
    params.require(:user).permit!
  end
end