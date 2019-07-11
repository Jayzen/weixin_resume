class CreateProductAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :product_attributes do |t|
      t.string :name
      t.string :content
      t.integer :order, default: 0
      t.boolean :reveal
      t.integer :product_id
      t.integer :user_id

      t.timestamps
    end
    add_index :product_attributes, :user_id
    add_index :product_attributes, :product_id
  end
end
