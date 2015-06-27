class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user] = @user.id
      flash[:notice] = ""
      redirect_to @user
    else
      flash[:notice] = "Invalid Info"
    end
  end

  def show
    @lists = current_user.lists
  end
  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
