class AddOrderToProductThemes < ActiveRecord::Migration[5.2]
  def change
    add_column :product_themes, :order, :integer, default: 0
  end
end
