class CreateOfficialAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :official_accounts do |t|
      t.string :name
      t.string :pic
      t.integer :user_id
      t.integer :order, default: 0
      t.boolean :reveal

      t.timestamps
    end

    add_index :official_accounts, :user_id
  end
end
