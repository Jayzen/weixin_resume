class CreateRechargeRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :recharge_records do |t|
      t.integer :guest_id
      t.decimal :recharge, precision: 5, scale: 2
      t.decimal :benefit, precision: 5, scale: 2
      t.integer :from, default: 0

      t.timestamps
    end
    add_index :recharge_records, :guest_id
  end
end
