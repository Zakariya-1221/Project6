class DashboardController < ApplicationController
    before_action :authenticate_user!

    def index
        if current_user.teacher?
            render 'teacher_dashboard'
        elsif current_user.student?
            render 'student_dashboard'
        else
            flash[:alert] = "User not found!"
            redirect_to users_path
        end
    end
end