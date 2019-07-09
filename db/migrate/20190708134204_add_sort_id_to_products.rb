class AddSortIdToProducts < ActiveRecord::Migration[5.2]
  def change
    remove_index :products, :product_sort_id
    remove_column :products, :product_sort_id
    add_column :products, :sort_id, :integer
    add_index :products, :sort_id
  end
end
