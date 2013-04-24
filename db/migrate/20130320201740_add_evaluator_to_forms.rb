class AddEvaluatorToForms < ActiveRecord::Migration
  def change
  	add_column :forms, :dept_evaluator, :string
  	add_column :forms, :dept_chair, :string
  end
end
