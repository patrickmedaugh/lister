class TasksController < ApplicationController
  def new
    @task = Task.new
  end
  def create
    @task = Task.new(task_params)
    @task.update(list_id: params[:id])
    if @task.save
      redirect_to list_path
    else
      flash[:notice] = "Invalid fields"
      render :new
    end
  end
  def edit
  end
  def update
  end
  private
  def task_params
    params.require(:task).permit(:title, :status, :due_date)
  end
end
