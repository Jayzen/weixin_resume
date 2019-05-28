class CreateWeddingBasics < ActiveRecord::Migration[5.2]
  def change
    create_table :wedding_basics do |t|
      t.string :name
      t.string :phone
      t.integer :user_id

      t.timestamps
    end
    add_index :wedding_basics, :user_id
  end
end
