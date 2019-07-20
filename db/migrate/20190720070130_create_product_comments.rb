class CreateProductComments < ActiveRecord::Migration[5.2]
  def change
    create_table :product_comments do |t|
      t.text :content
      t.integer :guest_id
      t.integer :product_id
      t.boolean :reveal

      t.timestamps
    end
    add_index :product_comments, :guest_id
    add_index :product_comments, :product_id
  end
end
