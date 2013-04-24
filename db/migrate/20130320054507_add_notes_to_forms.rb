class AddNotesToForms < ActiveRecord::Migration
  def change
  	add_column :forms, :notes, :text
  end
end
