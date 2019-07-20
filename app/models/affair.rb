class Affair < ApplicationRecord
  belongs_to :user
  has_many :affair_images, dependent: :destroy
  has_many :affair_comments, dependent: :destroy
  has_many :affair_likes, dependent: :destroy
  has_many :affair_shares, dependent: :destroy
  belongs_to :product, optional: true

  #like relationships
  has_many :like_affairs
  has_many :guests, through: :like_affairs

  module Status
    On = true
    Off = false
  end

  validates :content, presence: { message: "内容不能为空" }
end
