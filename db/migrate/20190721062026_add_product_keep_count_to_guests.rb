class AddProductKeepCountToGuests < ActiveRecord::Migration[5.2]
  def change
    remove_column :guests, :product_reserves_count
    add_column :guests, :product_keeps_count, :integer
  end
end
