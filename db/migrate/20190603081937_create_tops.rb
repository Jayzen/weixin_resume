class CreateTops < ActiveRecord::Migration[5.2]
  def change
    create_table :tops do |t|
      t.string :name
      t.string :pic
      t.datetime :weight
      t.integer :user_id
      t.boolean :reveal

      t.timestamps
    end
    add_index :tops, :user_id
  end
end
