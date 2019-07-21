class AddProductReservesCountToGuest < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :product_reserves_count, :integer, default: 0
  end
end
