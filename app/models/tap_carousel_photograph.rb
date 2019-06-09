class TapCarouselPhotograph < ApplicationRecord
  mount_uploader :home_pic, ImageUploader
  mount_uploader :category_pic, ImageUploader
  belongs_to :user
  belongs_to :tap_carousel
  has_many :tap_carousel_details

  module Status
    On = true
    Off = false
  end 

  validates :name, presence: { message: "标题不能为空" }
  validates :home_pic, presence: { message: "首页照片不能为空" }
  validates :category_pic, presence: { message: "分类照片不能为空" }
end
