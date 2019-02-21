class AddColumTotall < ActiveRecord::Migration[5.1]
  def change
    add_column :frames,:total,:integer, default: 0 
  end
end
