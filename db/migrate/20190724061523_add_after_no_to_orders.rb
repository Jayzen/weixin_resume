class AddAfterNoToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :after_no, :string
    add_column :orders, :after_status, :integer, default: 0
  end
end
