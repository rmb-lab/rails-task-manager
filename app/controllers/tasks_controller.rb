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
    @task = Task.create(task_params)
    @task.save
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to tasks_path
  end

  # UPDATE
  ## GET the form
  def edit
    @task = Task.find(params[:id])
  end

  ## POST the form
  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to tasks_path
  end

private

  # STRONG PARAMS
  def task_params
    params.require(:task).permit(:title, :details)
  end
end
