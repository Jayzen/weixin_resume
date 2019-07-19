class CreateAffairShares < ActiveRecord::Migration[5.2]
  def change
    create_table :affair_shares do |t|
      t.integer :guest_id
      t.integer :affair_id

      t.timestamps
    end
    add_index :affair_shares, :guest_id
    add_index :affair_shares, :affair_id
  end
end
