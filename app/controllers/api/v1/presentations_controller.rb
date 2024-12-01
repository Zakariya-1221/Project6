module Api
    module V1
      class PresentationsController < ApplicationController
        before_action :set_user
  
        # GET /api/v1/users/:user_id/presentations
        def index
          presentations = @user.presentations
          render json: presentations
        end
  
        # GET /api/v1/users/:user_id/presentations/:id
        def show
          presentation = @user.presentations.find(params[:id])
          render json: presentation
        end
  
        private
  
        def set_user
          @user = User.find(params[:user_id])
        rescue ActiveRecord::RecordNotFound
          render json: { error: "User not found" }, status: :not_found
        end
      end
    end
  end
  