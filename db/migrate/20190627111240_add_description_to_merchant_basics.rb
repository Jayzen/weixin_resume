class AddDescriptionToMerchantBasics < ActiveRecord::Migration[5.2]
  def change
    add_column :merchant_basics, :description, :text
  end
end
