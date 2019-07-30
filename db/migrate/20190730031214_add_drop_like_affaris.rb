class AddDropLikeAffaris < ActiveRecord::Migration[5.2]
  def change
    remove_index :like_affairs, :guest_id
    remove_index :like_affairs, :affair_id
    drop_table :like_affairs
  end
end
