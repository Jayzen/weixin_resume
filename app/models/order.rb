class Order < ApplicationRecord
  mount_uploader :snap_img, ImageUploader

  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products
  belongs_to :user
  belongs_to :guest
end
