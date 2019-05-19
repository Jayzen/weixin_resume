class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :latitude
      t.string :longitude
      t.integer :user_id

      t.timestamps
    end
    add_index :locations, :user_id
  end
end
