class RenameColumnNames < ActiveRecord::Migration
  def up
  	rename_column :departments, :department_name, :name
  	rename_column :schools, :school_name, :name
  end

  def down
  	rename_column :departments, :name, :department_name
  	rename_column :schools, :name, :school_name
  end
end
