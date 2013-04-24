class AddHcourseToCourses < ActiveRecord::Migration
  def change

  	add_column :courses, :hcourse_id, :string
  end
end
