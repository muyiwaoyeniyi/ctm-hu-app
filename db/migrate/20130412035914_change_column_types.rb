class ChangeColumnTypes < ActiveRecord::Migration
  def up
  	change_column :forms, :tCourse_hrs_total, :integer
  	change_column :forms, :hCourse_hrs_total, :integer
  	change_column :courses, :hCourse_hrs, :integer
  	change_column :courses, :tCourse_hrs, :integer
  end

  def down
  	change_column :forms, :tCourse_hrs_total, :string
  	change_column :forms, :hCourse_hrs_total, :string
  	change_column :courses, :hCourse_hrs, :string
  	change_column :courses, :tCourse_hrs, :string
  end
end
