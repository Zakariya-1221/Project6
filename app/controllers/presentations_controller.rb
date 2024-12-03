class PresentationsController < ApplicationController
  before_action :require_user
  before_action :set_presentation, only: [:show, :edit, :update, :destroy]
  before_action :authorize_presentation, only: [:edit, :update, :destroy]

  def new
    @presentation = Presentation.new
    @presentation.presenter = current_user  # Set the current user as presenter
  end

  def create
    @presentation = Presentation.new(presentation_params)
    @presentation.presenter = current_user  # Set the current user as presenter
    if @presentation.save
      redirect_to @presentation, notice: "Presentation created!"
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def index
    if current_user.admin?
      @presentations = Presentation.includes(:presenter, :feedbacks).all
    else
      @presentations = Presentation.all
    end
  end

  def show
    @feedbacks = if current_user.admin? || @presentation.presenter == current_user
                   @presentation.feedbacks.includes(:user)
                 else
                   []
                 end
  end

  def edit
  end

  def update
    if @presentation.update(presentation_params)
      redirect_to @presentation, notice: "Presentation updated!"
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @presentation.destroy
    redirect_to presentations_path, notice: "Presentation deleted!"
  end

  private

  def set_presentation
    @presentation = Presentation.find(params[:id])
  end

  def presentation_params
    params.require(:presentation).permit(:title, :description)
  end

  def authorize_presentation
    unless current_user.admin? || @presentation.presenter == current_user
      flash[:alert] = "You are not authorized to perform this action"
      redirect_to presentations_path
    end
  end
end