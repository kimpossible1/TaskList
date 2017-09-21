class TasksController < ApplicationController
  def index
    @tasks = Task.all
        return @tasks
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new(title: params[:task][:title], description: params[:task][:description], due_date: params[:task][:due_date], complete: false)
  end
end
