class AddCourseNameToForms < ActiveRecord::Migration
  def change
  	add_column :forms, :course_name, :string
  end
end
