class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :contact
      t.integer :user_id

      t.timestamps
    end
    add_index :contacts, :user_id
  end
end
