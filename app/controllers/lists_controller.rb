class ListsController < ApplicationController
  def index
  end
  def create
    @list = List.new(list_params)
    @list.update(user_id: current_user.id)
    if @list.save
      flash[:notice] = ""
      redirect_to @list
    else
      flash[:notice] = "List must have a title"
      render :new
    end
  end
  def new
    @list = List.new
  end
  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    if @list.save
      redirect_to @list
    else
      flash[:notice] = "List must have a title"
      render :edit
    end
  end

  def destroy
  end
  def archived
  end
  private
  def list_params
    params.require(:list).permit(:title)
  end
end
