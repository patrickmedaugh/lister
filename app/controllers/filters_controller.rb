class FiltersController < ApplicationController
  def status
    @tasks = Task.all.order(:status)
    respond_to do |format|
      format.json { render json: @tasks}
    end
  end

  def due_date
    @tasks = Task.all.order(:due_date)
    respond_to do |format|
      format.json { render json: @tasks}
    end
  end

  def title
    @tasks = Task.all.order(:title)
    respond_to do |format|
      format.json { render json: @tasks}
    end
  end
  
end
