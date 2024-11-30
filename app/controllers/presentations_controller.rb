class PresentationsController < ApplicationController
  before_action :set_presentation, only: [:show, :edit, :update, :destroy, :view_feedbacks] # Set the presentation for the show action
  before_action :require_teacher_or_ta, only: [ :new, :create, :edit, :update, :destroy] # Only teachers and TAs can create, edit, and delete presentations
  before_action :require_non_presenter, only: [:new_feedback] # Only students can give feedback

    def new
      @presentation = Presentation.new
      @presentation.feedbacks.build
    end
  
    def create
      @presentation = Presentation.new(presentation_params)
      if @presentation.save
        redirect_to @presentation, notice: "Presentation created!"
      else
        render "new", status: :unprocessable_entity
      end
    end

    def show
      @feedback = Feedback.find_by(presentation_id: @presentation.id, user_id: current_user.id)
    end

    def index
      @presentations = Presentation.all
    end

    def view_feedbacks
      if current_user == @presentation.presenter
        @feedbacks = @presentation.feedbacks
        @average_rating = @feedbacks.average(:rating)
        @final_score = @presentation.final_score
      else
        redirect_to root_path, alert: "You do not have permission to view this feedback."
      end
    end

    def new_feedback
      @feedback = @presentation.feedbacks.new
      @presentation = Presentation.all.where.not(presenter: current_user)
    end
    def destroy
        #@presentation = Presentation.find(params[:id])
        @presentation.destroy
        redirect_to presentations_path, notice: "Presentation deleted!"
    end

    def edit
      #@presentation = Presentation.find(params[:id])
    end

    def update
      #@presentation = Presentation.find(params[:id])
      if @presentation.update(presentation_params)
        redirect_to @presentation, notice: "Presentation updated!"
      else
        render "edit", status: :unprocessable_entity
      end
    end
    private

    def presentation_params
      params.require(:presentation).permit(:title, :description, feedbacks_attributes: [:score, :description])
    end

    def set_presentation
      @presentation = Presentation.find(params[:id])
    end

    def require_teacher_or_ta
      unless current_user.teacher? || current_user.ta?
        redirect_to presentations_path, alert: "You do not have permission to create, edit, or delete presentations."
      end
    end

    def require_non_presenter
      @presentation = Presentation.find(params[:presentation_id])
      if current_user == @presentation.presenter
        redirect_to @presentation, alert: "You cannot give feedback on your own presentation."
      end
    end
end