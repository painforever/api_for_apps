module SignupFuncs
  #public to call
  def sign_up
    patient = Patient.new(fname: params[:first_name], lname: params[:last_name], patient_email: params[:email], patient_id: Patient.maximum(:patient_id)+1)
    user = User.new(email_address: params[:email], password: params[:password], fname: params[:first_name],
                    lname: params[:last_name], race: "Unknown")
    if patient.save
      user.patient_id = patient.patient_id
      user.save
      UserMailer.send_mailer_myrxtracking(user).deliver_now
    end
    respond_to do |format|
      format.json {
        render_obj(user)
      }
    end
  end

  def email_repeat
    user=User.find_by_email_address(params[:email])
    respond_to do |format|
      if user
        format.json {render json: "yes"}
      else
        format.json {render json: "no"}
      end
    end
  end
end
