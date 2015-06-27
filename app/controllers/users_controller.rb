class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    if @user.save
      redirect_to @user
    else
      flash[:notice] = errors.full_messages.join(", ")
    end
  end
end