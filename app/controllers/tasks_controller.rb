class TasksController < ApplicationController
  # allow_unauthenticated_access only: [:index, :show]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render :new, status: :unprocessable_entry
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to @task
    else
      render :new, status: :unprocessable_entry
    end
  end

  private
  def task_params
    params.expect(task: [:name, :description, :created_by, :open])
  end
end
