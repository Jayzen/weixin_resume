class AddUserIdToProductThemes < ActiveRecord::Migration[5.2]
  def change
    add_column :product_themes, :user_id, :integer
    add_index :product_themes, :user_id
  end
end
