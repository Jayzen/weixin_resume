class AddProductIdToBannerItems < ActiveRecord::Migration[5.2]
  def change
    add_column :banner_items, :product_id, :integer
    add_index :banner_items, :product_id
  end
end
