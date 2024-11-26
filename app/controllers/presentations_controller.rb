class PresentationsController < ApplicationController
    def new
      @presentation = Presentation.new
      @presentation.feedbacks.build
    end
  
    def create
      @presentation = Presentation.new(presentation_params)
      if @presentation.save
        redirect_to @presentation, notice: "Presentation created!"
      else
        render 'new', status: :unprocessable_entity
      end
    end
  
    def show
      @presentation = Presentation.find(params[:id])
    end
  
    def index
      @presentations = Presentation.all
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
  end