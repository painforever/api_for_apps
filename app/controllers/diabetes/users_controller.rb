class Diabetes::UsersController < ApplicationController
  include SignupFuncs
  include ChangeInfoFuncs
  
  def patient_signup
    sign_up
  end

  def check_email_repeat
    email_repeat
  end
end
