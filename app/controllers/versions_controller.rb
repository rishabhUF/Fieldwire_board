class VersionsController < ApplicationController
	before_action :set_project , except: [:create]
	before_action :set_floorplan, except: [:create]
	before_action :set_project , except:  [:create]
	def create
		puts "hello"
		puts params[:version][:image].size
		 @project = Project.find(params[:project_id])	
		 @floorplan = Floorplan.find(params[:floorplan_id])

		 if Version.where(:name => params[:version]['name'], :floorplan_id => params[:floorplan_id]).blank?
			 @version = Version.create(version_params)
			 puts "created"
			 @version.floorplan_id = @floorplan.id
			 @version.user_id = current_user.id
			 @version.project_id = @project.id

			 if @version.save
			 	redirect_to @project
			 else
			 	redirect_to 'new'
			 end
		else
			puts "already there"
			@version = Version.where(:name => params[:version]['name']).first
			if (params[:version][:image].size - @version.image.size) > 1000
				flash[:error] =  "File too big than previous version"
				redirect_to @project
			else
				update
			end 
			
		end
	end

	def edit
	end

	def update
		if @version.update(version_params)
			redirect_to @project
		else
			redirect_to 'edit'
		end
	end

	private 

	def version_params
		params[:version].permit(:name,:image)
	end

	def set_project 
    	@project = Project.find(params[:project_id]) 
	end
	def set_floorplan 
   		@floorplan = Floorplan.find(params[:floorplan_id]) 
	end

	def set_version
		@version = @floorplan.versions.find(params[:id])
	end

end
