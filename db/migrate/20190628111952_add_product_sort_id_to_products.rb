class AddProductSortIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :product_sort_id, :integer
    add_index :products, :product_sort_id
  end
end
