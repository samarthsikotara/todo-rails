class Dashboard::ProjectsController < DashboardController

	before_action :set_project, only: [:show, :update, :destroy, :edit]

	def index
		@projects = ::Project.all
		render json: {:projects => @projects}	
	end

	def create
		@project = ::Project.new(project_params)
		if @project.save
			@project.reload
			render json: @project
		else
			render json: {:debug_message => "#{@project.errors.full_messages}", :message => "Some error while adding project details"},status: 422	
		end
	end

	def tasks
		@tasks = ::Task.where(:project_id => params[:id])
		render json: {:tasks => @tasks}
	end

	def edit

	end

	def show
		render json: ProjectSerializer.new(@project)
	end

	def destroy
		@project.destroy
		render json: {:message => "Project has been deleted successfully"}
	end

	def update
		if @project.update(project_params)
			render json: @project
		else
			render json: {:debug_message => "#{@project.errors.full_messages}", :message => "Some errors while updating project details, Try again letter!"},status: 422	
		end
	end

	private
	def set_project
		@project = ::Project.find(params[:id])
	end

	def project_params
		params.require(:project).permit(:name, :description, :completed, :completed_on)
	end

end