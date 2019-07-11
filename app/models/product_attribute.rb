class ProductAttribute < ApplicationRecord
  belongs_to :user
  belongs_to :product

  module Status
    On = true
    Off = false
  end

  validates :name, presence: { message: "名称不能为空" }
  validates :content, presence: { message: "内容不能为空" }
end
