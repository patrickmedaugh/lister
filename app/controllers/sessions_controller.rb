class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user] = @user.id
      redirect_to @user
    else
      flash[:notice] = "Invalid Login"
      redirect_to login_path
    end
  end
end
