class Ra::UsersController < ApplicationController
  def update_password
    new_user=User.find_by_user_id(params[:user_id])
    new_user.update(email_address: params[:email], password: params[:new_password])
    UserMailer.change_password(new_user).deliver_now
    ra_render new_user
  end

  def patient_signup
    if params[:token].nil?
      respond_to do |format|
        format.json {
          render json: "Auth failed"
          exit
        }
      end
    end
    patient = Patient.new(fname: params[:first_name], lname: params[:last_name], patient_email: params[:email], patient_id: Patient.maximum(:patient_id)+1)
    user = User.new(email_address: params[:email], password: params[:password], fname: params[:first_name],
                    lname: params[:last_name], race: "Unknown")
    if patient.save
      user.patient_id = patient.patient_id
      user.save
      UserMailer.send_mailer(user).deliver_now
    end

    respond_to do |format|
      format.json {
        render_obj(user)
      }
    end
  end


  def check_email_repeat
    user=User.find_by_email_address(params[:email])
    respond_to do |format|
      if user
        format.json {render json: "yes"}
      else
        format.json {render json: "no"}
      end
    end
  end

  def upload_avatar
    user = User.find(params[:user_id])
    user.avatar = params[:avatar]
    user.save
    render nothing: true
  end
end
