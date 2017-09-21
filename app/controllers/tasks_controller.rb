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

    #book_updates = (params[:task]
    #[:task][:title], params[:task][:description],  params[:task][:due_date])
    #
    # @task.update_attributes(book_updates)
    # if @task.update(title: params[:task][:title], description: params[:task][:description], due_date: params[:task][:due_date])
    #   redirect_to show_task_path(@task.id)
    # else
    #   render :edit
    # end
  end


  def complete
    task = Task.find(params[:id])
    task.complete!
    redirect_to tasks_path
  end

  def delete
    @task = Task.find(params[:id])
    @task.delete

    redirect_to tasks_path
  end

end
