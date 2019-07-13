class Product < ApplicationRecord
  mount_uploader :pic, ImageUploader
  has_many :product_images, dependent: :destroy
  has_many :product_details, dependent: :destroy
  has_many :product_attributes, dependent: :destroy
  has_many :affairs, dependent: :destroy
  belongs_to :user
  
  has_many :product_themes, dependent: :destroy
  has_many :themes, through: :product_themes
  
  has_many :order_products, dependent: :destroy
  has_many :orders

  has_many :product_sorts, dependent: :destroy
  has_many :sorts, through: :product_sorts

  has_one :product_home, dependent: :destroy
  has_one :banner_item, dependent: :destroy

  module Status
    On = true
    Off = false
  end
  
  validates :name, presence: { message: "名称不能为空" }
  validates :description, presence: { message: "描述不能为空" }
  validates :pic, presence: { message: "照片不能为空" }
  validates :current_price, presence: { message: "优惠后价格不能为空" }
  validates :old_price, presence: { message: "优惠前价格不能为空" }
end
