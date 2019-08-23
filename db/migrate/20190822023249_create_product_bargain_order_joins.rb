class CreateProductBargainOrderJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :product_bargain_order_joins do |t|
      t.integer :product_bargain_order_id
      t.integer :guest_id

      t.timestamps
    end
    add_index :product_bargain_order_joins, :product_bargain_order_id
    add_index :product_bargain_order_joins, :guest_id
  end
end
