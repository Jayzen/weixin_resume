class AddOrderToProductHomes < ActiveRecord::Migration[5.2]
  def change
    add_column :product_homes, :order, :integer
    add_column :product_homes, :reveal, :boolean
  end
end
