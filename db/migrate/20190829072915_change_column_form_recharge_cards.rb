class ChangeColumnFormRechargeCards < ActiveRecord::Migration[5.2]
  def change
    change_column :recharge_cards, :recharge, :decimal, scale: 2, precision: 5, default: 0.0
    change_column :recharge_cards, :benefit, :decimal, scale: 2, precision: 5, default: 0.0
  end
end
