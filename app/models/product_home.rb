class ProductHome < ApplicationRecord
  belongs_to :product
 
  validates :product_id, uniqueness: { message: "该商品已经被关联" , scope: :user_id}
  
  module Status
    On = true
    Off = false
  end
end
