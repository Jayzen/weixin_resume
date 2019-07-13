class RemoveUserIdFromOrderProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_products, :user_id, :integer
    remove_column :order_products, :guest_id, :integer
  end
end
