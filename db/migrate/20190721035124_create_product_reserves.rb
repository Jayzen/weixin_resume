class CreateProductReserves < ActiveRecord::Migration[5.2]
  def change
    create_table :product_reserves do |t|
      t.integer :guest_id
      t.integer :product_id

      t.timestamps
    end
    add_index :product_reserves, :guest_id
    add_index :product_reserves, :product_id
  end
end
