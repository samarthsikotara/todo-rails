class Dashboard::TasksController < DashboardController

	before_action :set_task, only: [:show, :update, :destroy, :edit]

	def index
		@tasks = ::Task.all
		render json: {:tasks => @tasks}	
	end

	def create
		@task = ::Task.new(task_params)
		if @task.save
			@task.reload
			render json: @task
		else
			render json: {:debug_message => "#{@task.errors.full_messages}", :message => "Some error while adding project task details"},status: 422	
		end
	end

	def show
		render json: TaskSerializer.new(@task)
	end

	def destroy
		@task.destroy
		render json: {:message => "Task has been deleted successfully"}
	end

	def update
		if @task.update(task_params)
			render json: @task
		else
			render json: {:debug_message => "#{@task.errors.full_messages}", :message => "Some errors while updating task details, Try again letter!"},status: 422	
		end
	end

	private
	def set_task
		@task = ::Task.find(params[:id])
	end

	def task_params
		params.require(:task).permit(:name, :description, :completed, :completed_on, :project_id)
	end

end