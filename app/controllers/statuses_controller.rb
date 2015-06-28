class StatusesController < ApplicationController

  def pending
    @task = Task.find(params[:id])
    @task.update(status: "pending")
    @task.save
    respond_to do |format|
      format.json { render json: @task}
    end
  end
  def incomplete
    @task = Task.find(params[:id])
    @task.update(status: "incomplete")
    respond_to do |format|
      format.json { render json: @task}
    end
  end
  def completed
    @task = Task.find(params[:id])
    @task.update(status: "complete")
    respond_to do |format|
      format.json { render json: @task}
    end
  end
end
