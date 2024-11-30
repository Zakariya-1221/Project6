class StaticPagesController < ApplicationController
  def home
  end

  def admin_dashboard
    @presentations = Presentation.all
    @users = User.all
    #redirect_to root_path, alert: "Access Denied." unless current_user.role.roleName == "teacher" || current_user.role.roleName == "ta"
  end
end
