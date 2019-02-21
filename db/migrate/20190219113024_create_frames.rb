class CreateFrames < ActiveRecord::Migration[5.1]
  def change
    create_table :frames do |t|
      t.integer :roll_1
      t.integer :roll_2
      t.integer :score
      t.string :move
      t.timestamps
    end
  end
end
