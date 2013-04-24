class CreateHcourses < ActiveRecord::Migration
  def change
    create_table :hcourses do |t|

    	t.string :name
    	t.string :number

      t.timestamps
    end
  end
end
