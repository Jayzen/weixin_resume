class AddFromToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :from, :integer, default: 0
  end
end
