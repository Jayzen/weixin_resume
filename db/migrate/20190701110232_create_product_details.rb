class CreateProductDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :product_details do |t|
      t.string :title
      t.string :pic
      t.integer :order, default: 0
      t.boolean :reveal
      t.integer :product_id
      t.integer :user_id

      t.timestamps
    end
    add_index :product_details, :user_id
    add_index :product_details, :product_id
  end
end
