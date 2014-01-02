class AddStatusToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :status, :boolean, :default => true
  end
end
