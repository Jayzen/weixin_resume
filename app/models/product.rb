class Product < ApplicationRecord
  mount_uploader :pic, ImageUploader
  has_many :product_images, dependent: :destroy
  has_one :affair, dependent: :destroy
  belongs_to :user

  module Status
    On = true
    Off = false
  end
  
  validates :name, presence: { message: "名称不能为空" }
  validates :description, presence: { message: "描述不能为空" }
  validates :pic, presence: { message: "照片不能为空" }
  validates :price, presence: { message: "价格不能为空" }
end
