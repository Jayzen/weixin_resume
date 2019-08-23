class CreateProductBargainOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :product_bargain_orders do |t|
      t.integer :guest_id
      t.integer :product_bargain_id

      t.timestamps
    end
    add_index :product_bargain_orders, :guest_id
    add_index :product_bargain_orders, :product_bargain_id
    add_index :product_bargain_orders, [:guest_id, :product_bargain_id], unique: true
  end
end
