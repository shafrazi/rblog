module Admin::SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
    #code
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    #code
  end

  def verify_logged_in
    unless current_user
      redirect_to admin_login_path
    end
    #code
  end

  def log_out
    session[:user_id] = nil
    @current_user = nil
    #code
  end

  def is_logged_in?
    !session[:user_id].nil?
    #code
  end
end
