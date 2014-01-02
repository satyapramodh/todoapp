class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
    	t.string :name
    	t.references :category

      t.timestamps
    end
  end
end
