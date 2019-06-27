class AddNameToMerchantBasics < ActiveRecord::Migration[5.2]
  def change
    add_column :merchant_basics, :name, :string
    add_column :merchant_basics, :phone, :string
    add_column :merchant_basics, :avatar, :string
  end
end
