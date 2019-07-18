class CreateAffairLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :affair_likes do |t|
      t.integer :guest_id
      t.integer :affair_id

      t.timestamps
    end
    add_index :affair_likes, :guest_id
    add_index :affair_likes, :affair_id
  end
end
