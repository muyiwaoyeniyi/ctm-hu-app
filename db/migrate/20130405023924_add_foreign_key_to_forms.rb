class AddForeignKeyToForms < ActiveRecord::Migration
  def up
  	rename_column :forms, :department, :department_id
  	rename_column :forms, :school, :school_id
  	change_column :forms, :department_id, :integer
  	change_column :forms, :school_id, :integer
  end

  def down
  	rename_column :forms, :department_id, :department
  	rename_column :forms, :school_id, :school
  	change_column :forms, :department, :string
  	change_column :forms, :school, :string
  end
end
