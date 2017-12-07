class FloorplansController < ApplicationController
	def create
		@project = Project.find(params[:project_id])
		@floorplan  = Floorplan.create(params[:floorplan].permit(:name, :image))
		@floorplan.user_id = current_user.id
		@floorplan.project_id = @project.id

		if @floorplan.save
			redirect_to project_path(@project)
		else
			redirect_to @project
		end
	end
end
