class AddMerchantToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :merchant, :string
  end
end
