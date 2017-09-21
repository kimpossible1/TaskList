class TasksController < ApplicationController
  def index
    @tasks = Task.all
        return @tasks
  end

  def show
    @task = Task.find(params[:id])
  end

end
