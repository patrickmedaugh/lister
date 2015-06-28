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
    @list        = List.find(params[:id])
    @othertasks  = @list.tasks.where(status: ["complete", "pending"])
    @incompletes = @list.tasks.where(status: "incomplete")
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

  def archive
    @list = List.find(params[:id])
    @list.update(archived?: true)
    redirect_to current_user
  end

  def unarchive
    @list = List.find(params[:id])
    @list.update(archived?: false)
    redirect_to current_user
  end

  def show_archived
    @lists = List.where(archived?: true)
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    flash[:notice] = "List deleted"
    redirect_to archived_path
  end
  private
  def list_params
    params.require(:list).permit(:title)
  end
end
