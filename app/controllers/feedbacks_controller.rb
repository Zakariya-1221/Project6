class FeedbacksController < ApplicationController
    before_action :require_user
    before_action :set_presentation
    before_action :set_feedback, only: [:edit, :update, :destroy]
    before_action :authorize_feedback, only: [:edit, :update, :destroy]
  
    def index
      if @presentation.presenter == current_user || current_user.admin?
        @feedbacks = @presentation.feedbacks.includes(:user)
      else
        flash[:alert] = "You can only view feedback for your own presentations"
        redirect_to presentations_path
      end
    end
  
    def new
      @feedback = @presentation.feedbacks.build
    end
  
    def create
      @feedback = @presentation.feedbacks.build(feedback_params)
      @feedback.user = current_user
  
      if @feedback.save
        flash[:success] = "Feedback submitted successfully"
        redirect_to presentation_path(@presentation)
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
    end
  
    def update
      if @feedback.update(feedback_params)
        flash[:success] = "Feedback updated successfully"
        redirect_to presentation_path(@presentation)
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @feedback.destroy
      flash[:notice] = "Feedback deleted successfully"
      redirect_to presentation_path(@presentation)
    end
  
    private
  
    def set_presentation
      @presentation = Presentation.find(params[:presentation_id])
    end
  
    def set_feedback
      @feedback = @presentation.feedbacks.find(params[:id])
    end
  
    def feedback_params
      params.require(:feedback).permit(:content, :rating)
    end
  
    def authorize_feedback
      unless @feedback.user == current_user || current_user.admin?
        flash[:alert] = "You can only modify your own feedback"
        redirect_to presentation_path(@presentation)
      end
    end
  
    def require_user
      unless logged_in?
        flash[:alert] = "You must be logged in to submit feedback"
        redirect_to login_path
      end
    end
  end