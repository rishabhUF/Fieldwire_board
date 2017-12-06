class FloorplansController < ApplicationController

	def create
		@project = Project.find(params[:project_id])
		@floorplan  = Floorplan.create(params[:floorplan].permit(:name))
		@floorplan.user_id = current_user.id
		@floorplan.project_id = @project.id

		if @floorplan.save
			redirect_to project_path(@project)
		else
			render 'new'
		end
	end
end