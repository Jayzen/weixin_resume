class RemoveRemarkFormRechargeCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :recharge_cards, :remark, :string
  end
end
