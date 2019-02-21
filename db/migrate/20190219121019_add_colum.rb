class AddColum < ActiveRecord::Migration[5.1]
  def change
    add_column :lines,:line_id,:integer
  end
end
