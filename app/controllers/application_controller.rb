class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter  :verify_authenticity_token
  #before_action :auth_token

  def render_proc_200
    Proc.new {|obj| render json: obj, status: 200}
  end

  def render_proc_500
    Proc.new {|obj| render json: obj, status: 500}
  end

  def auth_token
    if !params.has_key? :token
      render status: 500 and return false
    end
  end

  def ra_render(obj)
    if obj
      render json: obj, status: 200
    else
      render json: "failed", status: 500
    end
  end

  def render_when_save(obj)
    if obj.persisted?
      render_proc_200.call(obj)
    else
      obj.save ? render_proc_200.call(obj) : render_proc_500.call(obj)
    end
  end

  def render_with_persist(obj)
    obj.persisted? ? render_proc_200.call(obj) : render_proc_500.call(obj)
  end

  def render_by_boolean(flag, obj)
    if flag
      render json: obj, status: 200
    else
      render json: "failed", status: 500
    end
  end

  def render_obj(obj)
    if obj
      render json: {'status'=>'200', 'result'=>obj, 'msg'=>'good'}
    else
      render json: {'status'=>'404', 'result'=>'', 'msg'=>'No'}
    end
  end

  def render_obj_with_200(obj)
    if obj
      render json: {'status'=>'200', 'result'=>obj, 'msg'=>'good'}, status: 200
    else
      render json: {'status'=>'404', 'result'=>{}, 'msg'=>'No'}, status: 200
    end
  end

  def current_user(user_id)
    @user ||= User.find(user_id)
  end

  def current_patient
    @patient ||= Patient.find_by(patient_id: params[:patient_id])
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def bad_request(param)
    raise ActionController::BadRequest.new(param)
  end
end
