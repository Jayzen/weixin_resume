class AddRemarkToRechargeCards < ActiveRecord::Migration[5.2]
  def change
    add_column :recharge_cards, :remark, :string
  end
end
