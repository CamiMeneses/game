class AddColumToFrames < ActiveRecord::Migration[5.1]
  def change
    add_column :frames,:line_id,:integer
  end
end
