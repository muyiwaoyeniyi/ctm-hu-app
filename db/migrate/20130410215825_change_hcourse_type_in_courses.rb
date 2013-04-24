class ChangeHcourseTypeInCourses < ActiveRecord::Migration
  def up
  	change_column :courses, :hcourse_id, :integer
  end

  def down
  	change_column :courses, :hcourse_id, :string
  end
end
