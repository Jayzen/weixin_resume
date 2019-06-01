class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :title
      t.string :content
      t.string :pic
      t.integer :order, default: 0
      t.boolean :reveal
      t.string :price
      t.integer :user_id

      t.timestamps
    end
    add_index :menus, :user_id
  end
end
