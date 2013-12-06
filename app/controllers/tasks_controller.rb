class TasksController < ApplicationController
  respond_to :json

  def index
    @tasks = current_user.tasks
    respond_with @tasks
  end
  
  def create
  	@task = current_user.tasks.create(task_params)
    if @task.save
      respond_with @task
    end
  	
  end

  def update
  	@task = Task.find(params[:id])
  	@task.update(task_params)
  	if @task.save
      respond_with @task
    end
  end
 
  def destroy
  	@task = Task.find(params[:id])
  	@task.destroy
  	render nothing: true
  end

  protected

  def task_params
  	params[:task].delete("task")
    params.delete("id")
  	params.required(:task).permit(:content, :done, :user_id)
  end

end
