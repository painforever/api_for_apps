module ChangeInfoFuncs
  def update_password
  	user=User.find_by_user_id(params[:user_id])
    user.update(password: params[:new_password])
    ra_render user
  end
end