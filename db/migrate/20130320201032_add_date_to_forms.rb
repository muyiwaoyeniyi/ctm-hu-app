class AddDateToForms < ActiveRecord::Migration
  def change
  	add_column :forms, :date_course_taken, :string
  	remove_column :forms, :department
  	remove_column :forms, :school
  end
end
