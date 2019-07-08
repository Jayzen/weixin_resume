class Product < ApplicationRecord
  mount_uploader :pic, ImageUploader
  has_many :product_images, dependent: :destroy
  has_many :product_details, dependent: :destroy
  has_many :affairs, dependent: :destroy
  belongs_to :user
  belongs_to :product_sort, optional: true
  has_many :product_themes, dependent: :destroy
  has_many :themes, through: :product_themes
  has_one :home_product, dependent: :destroy

  module Status
    On = true
    Off = false
  end
  
  validates :name, presence: { message: "名称不能为空" }
  validates :description, presence: { message: "描述不能为空" }
  validates :pic, presence: { message: "照片不能为空" }
  validates :current_price, presence: { message: "优惠后价格不能为空" }
  validates :old_price, presence: { message: "优惠前价格不能为空" }
  validates :product_sort_id, presence: { message: "必须关联商品分类" }
end
