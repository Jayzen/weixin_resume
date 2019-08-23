class Order < ApplicationRecord
  #after_status 默认是0，1是申请退款中 2是退款成功 3是退款失败
  #order_no 是退款编号,用来微信退款用
  #after_no 是订单编号,只是用来显示
  #status 1表示待付款，2是完成付款，3是完成发货，4是收货
  #remark 0是默认值表示按照产品的价格支付， 1是按照团购价格支付显示 2是按照砍价价格支付显示
  mount_uploader :snap_img, ImageUploader

  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products
  belongs_to :user
  belongs_to :guest
end
