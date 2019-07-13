class CreateUserGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :user_guests do |t|
      t.integer :user_id
      t.integer :guest_id

      t.timestamps
    end
    add_index :user_guests, :user_id
    add_index :user_guests, :guest_id
    add_index :user_guests, [:user_id, :guest_id], unique: true
  end
end
