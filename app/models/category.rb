class Category < ActiveRecord::Base

belongs_to :company
has_many :tasks, dependent: :destroy
validates :name, presence: { message: 'Please provide a category name' }

default_scope order("name ASC")

def addTask(task_name)
	#check if task exists

	self.tasks.each do |task|
		if(task.name == task_name)
			return false
		end
	end
	
	#create if it doesn't
	if(done = self.tasks.create(:name => task_name))
		return true
	end

end

end
