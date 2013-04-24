class AddFieldsToCourses < ActiveRecord::Migration
  def change
  	add_column :courses, :tCourse_num, :string
  	add_column :courses, :tCourse_hrs, :string
  	add_column :courses, :hCourse_num, :string
  	add_column :courses, :hCourse, :string
  	add_column :courses, :hCourse_hrs, :string
  end
end
