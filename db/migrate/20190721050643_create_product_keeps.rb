class CreateProductKeeps < ActiveRecord::Migration[5.2]
  def change
    drop_table :product_reserves

    create_table :product_keeps do |t|
      t.integer :guest_id
      t.integer :product_id

      t.timestamps
    end
    add_index :product_keeps, :guest_id
    add_index :product_keeps, :product_id
  end
end
