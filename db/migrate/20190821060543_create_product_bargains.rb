class CreateProductBargains < ActiveRecord::Migration[5.2]
  def change
    create_table :product_bargains do |t|
      t.integer :user_id
      t.integer :product_id
      t.decimal :price, precision: 5, scale: 2
      t.integer :order
      t.boolean :reveal

      t.timestamps
    end
    add_index :product_bargains, :user_id
    add_index :product_bargains, :product_id
  end
end
