class Admin::ApplicationController < ActionController::Base
  include Admin::SessionsHelper
  layout "admin/application"
  before_action :logged_in_user

  private

  def logged_in_user
    unless is_logged_in?
      flash[:alert] = "Please login to proceed"
      redirect_to root_path
    end
    #code
  end
end
