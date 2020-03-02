class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
 
  def index
    @users = User.all
  end

  def show
  end
 
  def edit
  end
 
  def update
    if @user.update(permitted_params)
      redirect_to @user
    else
      render 'new'
    end
  end
 
  private

  def set_user
    @user = User.find(params[:id])
  end

  def permitted_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :phone, :bio)
  end
end
