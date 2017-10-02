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

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    @task.title = params[:task][:title]
    @task.description = params[:task][:description]
    @task.due_date = params[:task][:due_date]

    @task.save

    redirect_to task_path(@task)

  end

  # def date_completed
  #   @date_completed = DateTime.now
  # end

  def complete
    task = Task.find(params[:id])
    # date_completed
    unless task.complete == true
      task.completion_date = DateTime.now
    end

    task.complete!
    redirect_to tasks_path
  end

  # def confirm_delete
  #   @task = Task.find(params[:id])
  # end

  def delete
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

end
