class TasksController < ApplicationController

before_filter :authenticate_user!

def update
	@user = User.find_by(:id => current_user.id)
	@company = @user.company
	@task = Task.find(params[:id])
	
	@task.update(:status => false)
	@task.save
		respond_to do |format|
				format.html { redirect_to categories_path }
				format.js
		end
end

def rename
	@user = User.find_by(:id => current_user.id)
	@company = @user.company
	@task = Task.find(params[:id])
	@task.name = params[:tasks]["name"]
	@task.save
	respond_to do |format|
			format.html { redirect_to categories_path }
			format.js
	end

end


def edit
	@task = Task.find(params[:id])
	respond_to do |format|
			format.html { redirect_to categories_path }
			format.js
	end

end


# def destroy
# 	@user = User.find_by(:id => current_user.id)
# 	@company = @user.company
# 	@task = Task.find_by(:id => params[:id])
# 	@category = @task.category
# 	@task.destroy
# 	#flash[:notice] = "Task Deleted."
# 	respond_to do |format|
# 			format.html { redirect_to categories_path }
# 			format.js
# 	end
# end

def destroy_multiple
	@user = User.find_by(:id => current_user.id)
	@company = @user.company


	# ids=[]
	
	# ids = params[:tasks].select{|k,v| v.to_i==1}.keys
	# ids = ids.map{|key| key.to_i}.flatten
	# # params[:tasks].each do |key,val|
	# # 	if val.to_i==1
	# # 		ids<<key.to_i
	# # 	end
	# # end

  	Task.destroy_all(:status => false)
  	respond_to do |format|
			format.html { redirect_to categories_path }
			format.js
	end

end



end
