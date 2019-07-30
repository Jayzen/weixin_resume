class CreatePayRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :pay_records do |t|
      t.integer :user_id
      t.integer :guest_id
      t.string :pattern
      t.string :price
      t.string :remark

      t.timestamps
    end
    add_index :pay_records, :user_id
    add_index :pay_records, :guest_id
  end
end
