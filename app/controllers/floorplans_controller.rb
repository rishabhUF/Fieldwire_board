class FloorplansController < ApplicationController
	before_action :set_project , except:  [:create]
	before_action :set_floorplan , except: [:create, :new]
	# def create
	# 	@project = Project.find(params[:project_id])
	# 	@floorplan  = Floorplan.create(params[:floorplan].permit(:name, :image))
	# 	@floorplan.user_id = current_user.id
	# 	@floorplan.project_id = @project.id

	# 	if @floorplan.save
	# 		redirect_to project_path(@project)
	# 	else
	# 		redirect_to @project
	# 	end
	# end

	def new
		@floorplan = Floorplan.new
	end

	# def create
	# 		flag = true
	# 		puts "here in >1" 
	# 		puts params[:floorplan]['name']
	# 		@project = Project.find(params[:project_id])
	# 		params[:floorplan]['image'].each do |a|
	# 			puts "Hello"
	# 			if Floorplan.where(:name => params[:floorplan]['name'], :project_id => params[:project_id]).blank?
	# 				@floorplan  = Floorplan.create(:image => a)
	# 				puts "created"
	# 				@floorplan.user_id = current_user.id
	# 				@floorplan.project_id = @project.id
	# 				if (params[:floorplan]['image'].size < 2 && (!(params[:floorplan]['name'].empty?)))
	# 					@floorplan.name = params[:floorplan]['name']
	# 				end
	# 				@floorplan.save
	# 				# if @floorplan.save
	# 				# 	redirect_to project_path(@project)
	# 				# else
	# 				# 	redirect_to @project
	# 				# end
	# 			else
	# 				puts "already there"
	# 				@floorplan = Floorplan.where(:name => params[:floorplan]['name']).first
	# 				update
	# 				flag = false
				    
	# 			end

	# 		end	
	# 		if (@floorplan.save) && (flag == true)
	# 					redirect_to project_path(@project)
	# 				else
	# 					redirect_to @project
	# 				end
	# end

	# def edit
	# end

	# def update
	# 	puts "Inside update"
	# 	params[:floorplan]['image'].each do |a|
	# 	  if @floorplan.update(:image=>a)
	# 	  	@floorplan.update(params[:floorplan].permit(:name))
 #        	redirect_to @project
 #          else
	#         redirect_to 'edit'
	#       end
	#     end

	# end

	# def destroy
	# 	@project = Project.find(params[:project_id])
	# 	@floorplan = @project.floorplans.find(params[:id])
	# 	@floorplan.destroy

	# 	redirect_to project_path(@project)
 #    end

 	def create
 		@project = Project.find(params[:project_id])
 		@floorplan = Floorplan.create(floorplan_params)
 		@floorplan.user_id = current_user.id
 		@floorplan.project_id = @project.id

 		if @floorplan.save
 			redirect_to @project
 		else
 			redirect_to 'new'
 		end
 	end

 	def show
 		@floorplan = Floorplan.find(params[:project_id])
 		
 	end

 	def edit
 	end



    private
    def floorplan_params
      params[:floorplan].permit(:name)
	end
	def set_project 
    	@project = Project.find(params[:id]) 
	end
	def set_floorplan 
   		@floorplan = @project.floorplans.find(params[:project_id]) 
	end

end