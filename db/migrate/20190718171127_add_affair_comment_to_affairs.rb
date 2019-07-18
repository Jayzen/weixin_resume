class AddAffairCommentToAffairs < ActiveRecord::Migration[5.2]
  def change
    add_column :affairs, :affair_comments_count, :integer, default: 0
    add_column :affairs, :affair_likes_count, :integer, default: 0
  end
end
