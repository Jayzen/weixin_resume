class CreateProductImages < ActiveRecord::Migration[5.2]
  def change
    create_table :product_images do |t|
      t.string :title
      t.string :pic
      t.integer :order, default: 0
      t.boolean :reveal
      t.integer :product_id
      t.integer :user_id

      t.timestamps
    end
    add_index :product_images, :user_id
    add_index :product_images, :product_id
  end
end
