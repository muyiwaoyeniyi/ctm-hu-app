class RenameDepartment < ActiveRecord::Migration
  def up
  	rename_table :department, :departments
  	rename_table :school, :schools
  end

  def down
  	rename_table :departments, :department
  	rename_table :schools, :school
  end
end
