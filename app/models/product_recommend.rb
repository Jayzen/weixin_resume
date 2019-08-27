class ProductRecommend < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :product_id, uniqueness: { message: "该商品已经被关联" , scope: :user_id}
  
  module Status
    On = true
    Off = false
  end
end
