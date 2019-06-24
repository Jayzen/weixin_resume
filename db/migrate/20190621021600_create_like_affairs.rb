class CreateLikeAffairs < ActiveRecord::Migration[5.2]
  def change
    create_table :like_affairs do |t|
      t.integer :guest_id
      t.integer :affair_id

      t.timestamps
    end
    add_index :like_affairs, :guest_id
    add_index :like_affairs, :affair_id
  end
end
