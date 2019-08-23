class ProductGroup < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :product_group_orders, dependent: :destroy

  validates :price, presence: { message: "价格不能为空" }
  validates :product_id, presence: { message: "必须关联商品"}
  validates :product_id, uniqueness: { message: "该商品已经被关联" , scope: :user_id}

  module Status
    On = true
    Off = false
  end
end
