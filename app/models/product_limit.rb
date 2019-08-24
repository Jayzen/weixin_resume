class ProductLimit < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :limit, presence: { message: "过期时间不能为空" }
  validates :product_id, presence: { message: "必须关联商品"}
  validates :product_id, uniqueness: { message: "该商品已经被关联" , scope: :user_id}

  
  validate :limit_judge, unless: Proc.new { |a| a.limit.blank? }
  def limit_judge
    if limit <= Time.now
      errors.add(:limit, "过期时间不能使用过去时间")
    end
  end 

  module Status
    On = true
    Off = false
  end
end
