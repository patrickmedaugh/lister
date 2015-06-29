class FiltersController < ApplicationController
  def status
    @tasks = Task.where(list_id: params[:id]).reorder(status: :asc)
    respond_to do |format|
      format.json { render json: @tasks}
    end
  end

  def due_date
    @tasks = Task.where(list_id: params[:id]).reorder(due_date: :asc)
    respond_to do |format|
      format.json { render json: @tasks}
    end
  end

  def title
    @tasks = Task.where(list_id: params[:id]).reorder(title: :asc)
    respond_to do |format|
      format.json { render json: @tasks}
    end
  end

end
