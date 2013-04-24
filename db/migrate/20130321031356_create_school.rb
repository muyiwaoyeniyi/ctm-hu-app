class CreateSchool < ActiveRecord::Migration
  def up
  	create_table :school do |t|      
    	t.string :school_name
  
    	t.timestamps      
  	end
  end

  def down
  	drop_table :school
  end
end
