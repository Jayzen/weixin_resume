class CreateRechargeCards < ActiveRecord::Migration[5.2]
  def change
    create_table :recharge_cards do |t|
      t.integer :user_id
      t.integer :order
      t.boolean :reveal
      t.integer :recharge
      t.integer :benefit

      t.timestamps
    end
    add_index :recharge_cards, :user_id
  end
end
