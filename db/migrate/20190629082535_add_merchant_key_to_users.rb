class AddMerchantKeyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :merchant_key, :string
    add_column :users, :merchant_id, :string
  end
end
