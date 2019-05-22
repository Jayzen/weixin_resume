class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :small_pic
      t.string :big_pic
      t.integer :order
      t.string :price
      t.text :content
      t.integer :user_id

      t.timestamps
    end
    add_index :categories, :user_id
  end
end
