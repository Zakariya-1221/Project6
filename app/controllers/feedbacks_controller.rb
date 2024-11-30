class FeedbacksController < ApplicationController
   before_action :set_presentation
   before_action :authorize_user, only: [ :create ]  # Ensure only appropriate users can submit feedback

    def new
        if current_user == @presentation.presenter
            # if the current user is the presenter, redirect_to feedback summary
            redirect_to @presentation, alert: "You do not have permission to submit feedback."
        else
            # if non-presenter, show feedback submission form
            @feedback = @presentation.feedbacks.build
        end
    end

    # Non-presenters can submit feedback
    def create
      @feedback = Feedback.new(feedback_params)
      #@feedback = @presentation.feedbacks.build(feedback_params)
      # @feedback.user = current_user  # Assuming the current user is submitting feedback
      @presentation = Presentation.find(@feedback.presentation_id)
      if @feedback.save
        redirect_to @presentation, notice: "Feedback successfully submitted."
      else
        redirect_to new_feedback_presentation_path(@presentation), alert: "Unable to submit feedback."
      end
    end

    # Presenters can view all feedback
    def show_feedbacks
      # Check if the current user is the presenter for the presentation
      if current_user == @presentation.presenter
        @feedbacks = @presentation.feedbacks
        @average_rating = @feedbacks.average(:rating)
        @final_score = @presentation.final_score
      else
        redirect_to root_path, alert: "You do not have permission to view this feedback."
      end
    end

    private

    def set_presentation
      @presentation = Presentation.find(params[:presentation_id])
    end

    def feedback_params
      #params.require(:feedback).permit(:content, :rating, :presenter_id)
      params.require(:feedback).permit(:presentation_id, :rating, :description)
    end

    def authorize_user
      # For feedback creation, we can allow anyone (except presenters) to submit feedback
      unless current_user.role == "student" || current_user.role == "ta" || current_user.role == "teacher"
        redirect_to root_path, alert: "You do not have permission to submit feedback."
      end
    end
end
