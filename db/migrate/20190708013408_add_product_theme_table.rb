class AddProductThemeTable < ActiveRecord::Migration[5.2]
  def change
    create_table :product_themes do |t|
      t.integer :theme_id
      t.integer :product_id

      t.timestamps
    end
    add_index :product_themes, [:theme_id, :product_id], unique: true 
  end
end
