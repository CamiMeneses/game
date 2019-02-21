class DeleteLineId < ActiveRecord::Migration[5.1]
  def change
    remove_column :lines,:line_id,:integer 
  end
end
