class AddProductCommentsCountToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :product_comments_count, :integer
    add_column :products, :product_likes_count, :integer
  end
end
