class CreateGuestAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :guest_addresses do |t|
      t.integer :guest_id
      t.string :name
      t.string :mobile
      t.string :province
      t.string :city
      t.string :country
      t.string :detail

      t.timestamps
    end
    add_index :guest_addresses, :guest_id
  end
end
