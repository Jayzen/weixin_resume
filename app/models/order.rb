class Order < ApplicationRecord
  #after_status 默认是0，1是申请退款中 2是退款成功 3是退款失败
  #order_no 是退款编号,用来微信退款用
  #after_no 是订单编号,只是用来显示
  #status 默认是0，表示订单生成，1是完成付款，2是完成发货，3是收货

  mount_uploader :snap_img, ImageUploader

  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products
  belongs_to :user
  belongs_to :guest
end
