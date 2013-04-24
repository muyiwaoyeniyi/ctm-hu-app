class RemovehCourseFromCourses < ActiveRecord::Migration
  def up
  	remove_column :courses, :hCourse
  	remove_column :courses, :hCourse_num
  end

  def down
  	add_column :courses, :hCourse_num
  	add_column :courses, :hCourse
  end
end
