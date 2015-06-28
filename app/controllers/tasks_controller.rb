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
    @task = Task.find(params[:task_id])
  end

  def update
    @task = Task.find(params[:task_id])
    @task.update(task_params)
    if @task.save
      redirect_to list_path(@task.list)
    else
      flash[:notice] = "Invalid fields"
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to current_user
  end
  private
  def task_params
    params.require(:task).permit(:title, :description, :status, :due_date)
  end
end
