class CreateProductHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :product_homes do |t|
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
    add_index :product_homes, :user_id
    add_index :product_homes, :product_id
  end
end
