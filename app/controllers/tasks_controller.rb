class TasksController < ApplicationController
	before_action :get_task, only: [:edit , :update, :show]

	def new
		@task = Task.new
	end

	def create
		@task = current_user.tasks.new(task_params)
		if @task.save
			redirect_to task_path(@task)
		else
			redirect_to new_task_path
		end
	end

	def edit
		
	end

	def show
		
	end


  
  private

	def task_params
		params.require(:task).permit(:name,:end_date,:status)
	end

	def get_task
		@task = Task.find(params[:id])
	end
end
