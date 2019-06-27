class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :pic
      t.integer :order, default: 0
      t.boolean :reveal
      t.string :price
      t.integer :user_id

      t.timestamps
    end
    add_index :products, :user_id
  end
end
