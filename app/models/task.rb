class Task < ActiveRecord::Base

belongs_to :category

validates :name, presence: { message: 'Please provide a task description' }

default_scope order("name ASC")


end
