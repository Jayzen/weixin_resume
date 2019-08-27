class CreateProductRecommends < ActiveRecord::Migration[5.2]
  def change
    drop_table :product_homes

    create_table :product_recommends do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :order
      t.boolean :reveal

      t.timestamps
    end
    add_index :product_recommends, :user_id
    add_index :product_recommends, :product_id
  end
end
