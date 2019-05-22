class CreateConsults < ActiveRecord::Migration[5.2]
  def change
    create_table :consults do |t|
      t.string :name
      t.string :contact
      t.integer :user_id

      t.timestamps
    end
    add_index :consults, :user_id
  end
end
