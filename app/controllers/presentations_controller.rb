class PresentationsController < ApplicationController
  before_action :set_presentation # Set the presentation for the show action
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
      @presentation = Presentation.find(params[:id])
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
    def destroy
        @presentation = Presentation.find(params[:id])
        @presentation.destroy
        redirect_to presentations_path, notice: "Presentation deleted!"
    end

    private

    def presentation_params
      params.require(:presentation).permit(:title, :description, feedbacks_attributes: [:score, :description])
    end

    def set_presentation
      @presentation = Presentation.find(params[:id])
    end
end