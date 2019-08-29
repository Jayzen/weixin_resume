class ChangeGuestRecharge < ActiveRecord::Migration[5.2]
  def change
    change_column :guests, :recharge, :decimal, precision: 5, scale: 2, default: 0.0
  end
end
