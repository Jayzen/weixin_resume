class BannerItem < ApplicationRecord
  mount_uploader :pic, ImageUploader
  belongs_to :user
  belongs_to :banner
  belongs_to :product, optional: true

  module Status
    On = true
    Off = false
  end

  validates :name, presence: { message: "标题不能为空" }
  validates :pic, presence: { message: "照片不能为空" } 
  validates :product_id, presence: { message: "关联商品不能为空" }
end
