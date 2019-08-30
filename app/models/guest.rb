class Guest < ApplicationRecord
  validates :password, length: { minimum: 6, message: "密码不能少于6个字符" }, allow_nil: true
  #validates :password, length: { minimum: 6 }, allow_nil: true

  has_many :user_guests, dependent: :destroy
  has_many :users, through: :user_guests

  has_one :guest_address, dependent: :destroy
  has_many :orders, dependent: :destroy

  has_many :comments, dependent: :destroy
  has_many :affair_comments, dependent: :destroy
  has_many :affair_likes, dependent: :destroy
  has_many :affair_shares, dependent: :destroy

  has_many :product_comments, dependent: :destroy
  has_many :product_likes, dependent: :destroy
  has_many :product_keeps, dependent: :destroy

  has_many :pay_records, dependent: :destroy
  has_many :recharge_records, dependent: :destroy

  has_many :product_group_orders, dependent: :destroy
  has_many :product_group_order_joins, dependent: :destroy
  has_many :product_bargain_orders, dependent: :destroy
  has_many :product_bargain_order_joins, dependent: :destroy
end
