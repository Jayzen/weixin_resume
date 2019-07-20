class ChangeProductCommentsCountToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :product_comments_count, :integer, default: 0
    change_column :products, :product_likes_count, :integer, default: 0 
  end
end
