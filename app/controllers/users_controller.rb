class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:index, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = Role.find_by(roleName: 'student') # Set default role to student
    
    if @user.save
      session[:user_id] = @user.id # Automatically log in the new user
      flash[:success] = "Account created successfully!"
      redirect_to root_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def index
    @users = User.includes(:role).all # Use includes to avoid N+1 queries
  end

  def show
    # set_user before_action handles nil check
  end

  def edit
    # set_user before_action handles nil check
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "User deleted successfully!"
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
    end

    if @user.update(user_params)
      flash[:success] = "User updated successfully!"
      redirect_to user_path(@user)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
    if @user.nil?
      flash[:alert] = "User not found!"
      redirect_to users_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def require_admin
    unless current_user&.admin?
      flash[:alert] = "You must be an admin to access this page"
      redirect_to root_path
    end
  end
end