class AddtCourseToCourses < ActiveRecord::Migration
  def up
  	add_column :courses, :tCourse, :string
  end

  def down
  	remove_column :courses, :tCourse, :string
  end
end
