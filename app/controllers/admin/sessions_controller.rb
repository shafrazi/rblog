class Admin::SessionsController < Admin::ApplicationController
  before_action :logged_in_user, only: [:index]
  layout "admin/login"
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      log_in(user)
      flash[:notice] = "Logged in as #{current_user.name}"
      # log in the user and redirect
      redirect_to admin_posts_path
    else
      flash.now[:alert] = "Invalid email/password combination"

      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_path
    #code
  end
end
