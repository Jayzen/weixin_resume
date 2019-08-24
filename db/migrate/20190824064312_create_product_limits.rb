class CreateProductLimits < ActiveRecord::Migration[5.2]
  def change
    create_table :product_limits do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :order
      t.boolean :reveal
      t.datetime :limit

      t.timestamps
    end
    add_index :product_limits, :user_id
    add_index :product_limits, :product_id
  end
end
