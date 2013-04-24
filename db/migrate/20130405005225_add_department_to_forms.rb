class AddDepartmentToForms < ActiveRecord::Migration
  def change
  	add_column :forms, :department, :string
  	add_column :forms, :school, :string
  	add_column :forms, :tCourse_hrs_total, :string
  	add_column :forms, :hCourse_hrs_total, :string
  end
end
