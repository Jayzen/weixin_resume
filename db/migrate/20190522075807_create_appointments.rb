class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :name
      t.string :contact
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :appointments, :user_id
  end
end
