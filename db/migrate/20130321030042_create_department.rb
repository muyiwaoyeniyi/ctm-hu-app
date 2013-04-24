class CreateDepartment < ActiveRecord::Migration
  def up
  	create_table :department do |t|      
    	t.string :department_name
  
    	t.timestamps      
  	end
  end

  def down
  	drop_table :department
  end
end
