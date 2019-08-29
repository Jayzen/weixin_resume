class AddRechargeToGuest < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :recharge, :decimal, precision: 5, scale: 2
  end
end
