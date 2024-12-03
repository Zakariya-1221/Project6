class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  
  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def require_user
    unless logged_in?
      flash[:alert] = "You must be logged in to access this page"
      redirect_to login_path
    end
  end

  def require_admin
    unless current_user&.admin?
      flash[:alert] = "You must be an admin to access this page"
      redirect_to root_path
    end
  end
end