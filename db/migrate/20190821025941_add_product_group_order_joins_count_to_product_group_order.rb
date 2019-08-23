class AddProductGroupOrderJoinsCountToProductGroupOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :product_group_orders, :product_group_order_joins_count, :integer, default: 0
  end
end
