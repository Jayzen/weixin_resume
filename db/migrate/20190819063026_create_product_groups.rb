class CreateProductGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :product_groups do |t|
      t.string :name
      t.integer :user_id
      t.integer :product_id
      t.decimal :price, precision: 5, scale: 2

      t.timestamps
    end
    add_index :product_groups, :user_id
    add_index :product_groups, :product_id
  end
end
