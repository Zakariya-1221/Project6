class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin!

  def home
    # No data needed for now; just a simple page with links
  end

  private

  def ensure_admin!
    unless current_user.role.roleName == "teacher" || current_user.role.roleName == "ta"
      redirect_to root_path, alert: "Access Denied."
    end
  end
end