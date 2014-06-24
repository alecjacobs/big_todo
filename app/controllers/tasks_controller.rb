class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(params[:task])

    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @task = Task.find(params[:id])

    if params["completed"] == "true"
      @task.completed = true
      @task.save
      redirect_to tasks_path and return
    end

    if params["completed"] == "false"
      @task.completed = false
      @task.save
      redirect_to tasks_path and return
    end

    if @task.update_attributes(params[:task])
      redirect_to tasks_path
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
    end
  end
end
