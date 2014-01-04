class CategoriesController < ApplicationController

before_filter :authenticate_user!
 

def index
	@user = User.find_by(:id => current_user.id)
	@company = @user.company
end

def create
	index
	@query = params[:categories]["name"].split("@")
	@category_name = @query.pop

	@task_name = @query.join("@")

	if(@category_name.blank? || @task_name.blank?)
		#flash[:notice] = "Please follow the pattern."
		redirect_to categories_path
		return
	end
	
	@category_name = @category_name.downcase.delete(" ")
	@category = @company.categories.find_by(:name => @category_name).nil? ? Category.create(:name=>@category_name) : @company.categories.find_by(:name=>@category_name)
	@category.company = @company
	@category.save
	
	if(@category.addTask(@task_name))
		#flash[:notice] = "Task created."
		respond_to do |format|
			format.html { redirect_to categories_path }
			format.js
		end
	
	else
		@message = "Task name already exists."
	end
end

def destroy
	index
	@category = Category.find_by(:id => params[:id])
	@category.destroy
	#flash[:notice] = "Category Deleted."
	respond_to do |format|
			format.html { redirect_to categories_path }
			format.js
	end
end

end
