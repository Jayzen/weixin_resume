class Theme < ApplicationRecord
  mount_uploader :home_pic, ImageUploader
  mount_uploader :theme_pic, ImageUploader
  belongs_to :user
  has_many :product_themes, dependent: :destroy
  has_many :products, through: :product_themes

  module Status
    On = true
    Off = false
  end

  validates :name, presence: { message: "名称不能为空" }
  validates :home_pic, presence: { message: "首页栏主题照片不能为空" }
  validates :theme_pic, presence: { message: "主题栏主题照片不能为空" }
end
