class CreateTapPhotographs < ActiveRecord::Migration[5.2]
  def change
    create_table :tap_photographs do |t|
      t.string :name
      t.string :pic
      t.integer :order, default: 0
      t.integer :user_id
      t.integer :tap_sort_id
      t.boolean :reveal

      t.timestamps
    end
    add_index :tap_photographs, :user_id
    add_index :tap_photographs, :tap_sort_id
  end
end
