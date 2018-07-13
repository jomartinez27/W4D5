class AddgoalcompletetoGoals < ActiveRecord::Migration[5.1]
  def change
    add_column :goals, :completed, :boolean, null: false, default: false 
    
  end
end
