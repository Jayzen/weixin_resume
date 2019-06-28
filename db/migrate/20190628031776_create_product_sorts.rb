class CreateProductSorts < ActiveRecord::Migration[5.2]
  def change
    create_table :product_sorts do |t|
      t.string :name
      t.integer :order, default: 0
      t.integer :user_id
      t.boolean :reveal

      t.timestamps
    end
    add_index :product_sorts, :user_id
  end
end
