class AddNameToRechargeCards < ActiveRecord::Migration[5.2]
  def change
    add_column :recharge_cards, :name, :string
  end
end
