class TasksController < ApplicationController
  def index
    @tasks = Task.all
    return @tasks
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(title: params[:task][:title], description: params[:task][:description], due_date: params[:task][:due_date], complete: false)

    if @task.save
      task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def complete
    task = Task.find(params[:id])
    task.complete!
    redirect_to tasks_path
  end

end
