class CreateProductGroupOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :product_group_orders do |t|
      t.integer :guest_id
      t.integer :product_group_id

      t.timestamps
    end
    add_index :product_group_orders, :guest_id
    add_index :product_group_orders, :product_group_id
  end
end
