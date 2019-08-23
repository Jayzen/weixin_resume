class AddOrderToProductGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :product_groups, :order, :integer
    add_column :product_groups, :reveal, :boolean
  end
end
