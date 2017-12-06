class ProjectsController < ApplicationController
	before_action :find_project, only:[:edit, :update, :destroy, :show]
	before_action :authenticate_user!
	def show
		@floorplans = Floorplan.where(project_id: @project)
	end

	def index
		# @projects = Project.all.order("created_at DESC")
		@projects = Project.where(user_id: current_user)
	end

	def new
		@project = current_user.projects.build
	end

	def create
		@project = current_user.projects.build(project_params)

		if @project.save
			redirect_to @project
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @project.update(project_params)
			redirect_to @project
		else
			redirect_to 'edit'
		end
	end

	def destroy
		@project.destroy
		redirect_to root_path
	end

	private 

	def project_params
		params.require(:project).permit(:title, :description)
	end

	def find_project
		@project = Project.find(params[:id])
	end
end
