class AddCurrentPriceToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :current_price, :decimal, precision: 5, scale: 2
    add_column :products, :old_price, :decimal, precision: 5, scale: 2
    add_column :products, :stock, :integer
    remove_column :products, :price
  end
end
