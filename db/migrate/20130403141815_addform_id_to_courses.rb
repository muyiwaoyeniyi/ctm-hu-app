class AddformIdToCourses < ActiveRecord::Migration
  def up
  	add_column :courses, :form_id, :integer
  end

  def down
  	remove_column :courses, :form_id, :integer
  end
end
