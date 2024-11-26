class PresentationsController < ApplicationController
  def index
    @presentations = Presentation.all
  end

  def show
    @presentation = Presentation.find_by_id(params[:id])
    #debugger
    if @presentation.nil?
      flash[:alert] = "Presentation not found"
      redirect_to presentations_path
    else
      @feedbacks = @presentation.feedbacks
    end
  end

  def new
    @presentation = Presentation.new
  end

  def create
    @presentation = Presentation.new(presentation_params)
    if @presentation.save
      flash[:success] = "Presentation successfully created"
      redirect_to presentation_path(@presentation), notice: "Presentation created"
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @presentation = Presentation.find(params[:id])
  end

  def update
    @presentation = Presentation.find(params[:id])
    if @presentation.update(presentation_params)
      redirect_to @presentation, notice: "Presentation updated"
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @presentation = Presentation.find(params[:id])
    @presentation.destroy
    redirect_to presentations_path, notice: "Presentation deleted"
  end

  private
  def presentation_params
    params.require(:presentation).permit(:title, :description, :date, :time, :presenter_id)
  end
end
