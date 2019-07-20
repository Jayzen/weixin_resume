class CreateProductLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :product_likes do |t|
      t.integer :guest_id
      t.integer :product_id

      t.timestamps
    end
    add_index :product_likes, :guest_id
    add_index :product_likes, :product_id
  end
end
