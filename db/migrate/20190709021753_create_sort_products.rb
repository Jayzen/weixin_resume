class CreateSortProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :product_sorts do |t|
      t.integer :product_id
      t.integer :sort_id
      t.integer :user_id
      t.integer :order
      t.boolean :reveal

      t.timestamps
    end
    add_index :product_sorts, :product_id
    add_index :product_sorts, :sort_id
    add_index :product_sorts, :user_id
    add_index :product_sorts, [:sort_id, :product_id], unique: true
  end
end
