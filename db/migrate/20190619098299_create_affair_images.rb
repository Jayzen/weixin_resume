class CreateAffairImages < ActiveRecord::Migration[5.2]
  def change
    create_table :affair_images do |t|
      t.string :name
      t.string :pic
      t.integer :user_id
      t.integer :affair_id
      t.integer :order, default: 0
      t.boolean :reveal

      t.timestamps
    end

    add_index :affair_images, :user_id
    add_index :affair_images, :affair_id
  end
end
