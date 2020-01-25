class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  # CREATE
  ## GET the form
  def new
    @task = Task.new
  end

  ## POST the form
  def create
    @task = Task.new(params[:task])
    @task.save
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to task_path(@task)
  end

  # UPDATE
  ## GET the form
  def edit
    @task = Task.find(params[:id])
  end

  ## POST the form
  def update
    @task = Task.find(params[:id])
    @task.update(params[:task])
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to task_path(@task)
  end

private

  # STRONG PARAMS
  def task_params
    params.require(:task).permit(:title, :details)
  end

end
