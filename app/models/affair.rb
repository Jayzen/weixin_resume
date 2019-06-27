class Affair < ApplicationRecord
  belongs_to :user
  has_many :affair_images, dependent: :destroy
  has_many :affair_comments, dependent: :destroy
  belongs_to :product

  #like relationships
  has_many :like_affairs
  has_many :guests, through: :like_affairs

  module Status
    On = true
    Off = false
  end

  #default_scope { order(created_at: :desc).where(reveal: true) }  
  
  validates :name, presence: { message: "名称不能为空" }
  validates :product_id, presence: { message: "必须关联商品" }
end
