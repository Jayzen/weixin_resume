class CreateMenuDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_details do |t|
      t.string :title
      t.string :pic
      t.integer :order, default: 0
      t.boolean :reveal
      t.integer :menu_id
      t.integer :user_id

      t.timestamps
    end
    add_index :menu_details, :user_id
    add_index :menu_details, :menu_id
  end
end
