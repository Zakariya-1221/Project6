class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User created!"
      redirect_to user_path(@user), notice: "User created!"
    else
      flash[:alert] = "There was an error creating the user."
      render 'new', status: :unprocessable_entity
    end
  end

  def index
    @users = User.all
  end

  def show
    if @user.nil?
      flash[:alert] = "User not found!"
      redirect_to users_path
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    if @user.nil?
      flash[:alert] = "User not found!"
      redirect_to users_path
    end

  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user.nil?
      flash[:alert] = "User not found!"
      redirect_to users_path
    else
      @user.destroy
      redirect_to users_path, notice: "User deleted!"
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = "User updated!"
      redirect_to user_path(@user), notice: "User updated!"
    else
      flash[:alert] = "There was an error updating the user."
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
end
