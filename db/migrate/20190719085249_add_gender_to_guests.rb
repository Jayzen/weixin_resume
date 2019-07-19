class AddGenderToGuests < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :gender, :integer
  end
end
