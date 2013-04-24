class FixColumnName < ActiveRecord::Migration
  def up
  	 rename_column :forms, :course_name, :last_name
  end

  def down
  	rename_column :forms, :last_name, :course_name
  end
end
