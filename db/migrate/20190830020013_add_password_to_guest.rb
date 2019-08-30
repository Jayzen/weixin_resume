class AddPasswordToGuest < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :password, :string, default: nil
  end
end
