class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :openid
      t.string :nickname
      t.string :avatar
      
      t.timestamps
    end
  end
end
