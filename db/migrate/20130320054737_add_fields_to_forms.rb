class AddFieldsToForms < ActiveRecord::Migration
  def change
  	add_column :forms, :first_name, :string
  	add_column :forms, :initial, :string
  	add_column :forms, :student_id, :string
  	add_column :forms, :student_ssn, :string
  	add_column :forms, :department, :string
  	add_column :forms, :school, :string
  	add_column :forms, :source_of_credit, :string
  	add_column :forms, :location, :string
  end
end
