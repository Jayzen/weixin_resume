class CreateWorkshopBasics < ActiveRecord::Migration[5.2]
  def change
    create_table :workshop_basics do |t|
      t.string :name
      t.string :phone
      t.string :business_hour
      t.integer :user_id

      t.timestamps
    end
    add_index :workshop_basics, :user_id
  end
end
