class FeedbacksController < ApplicationController
    def new
        @feedback = Feedback.new
    end

    def create
        @presentation = Presentation.find(params[:presentation_id])
        @feedback = @presentation.feedbacks.build(feedback_params)
        if @feedback.save
          redirect_to @presentation, notice: 'Feedback was successfully created.'
        else
          redirect_to @presentation, alert: 'Failed to create feedback.'
        end
    end
    

    def show
        @presentation = Presentation.find(params[:presentation_id])
        @feedbacks = @presentation.feedbacks
      end

    def index
        @presentation = Presentation.find(params[:presentation_id])
        @feedbacks = @presentation.feedbacks
    end

    def destroy
        @feedback = Feedback.find(params[:id])
        @feedback.destroy
        redirect_to feedbacks_path, notice: "Feedback deleted!"
    end

    private
    
    def feedback_params
        params.require(:feedback).permit(:content, :rating)
    end
end
