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
      @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def Edit
    @task = Task.find(params[:id])

    @task.update
    if @task.update
    redirect_to show_task_path
    else
    render 'edit'
    end
    # @task.title = params[:task][:title]
    # @task.description = params[:task][:description]
    # @task.due_date = params[:task][:due_date]

  end

  def complete
    task = Task.find(params[:id])
    task.complete!
    redirect_to tasks_path
  end

end
