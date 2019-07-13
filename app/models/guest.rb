class Guest < ApplicationRecord
  has_many :user_guests, dependent: :destroy
  has_many :users, through: :user_guests

  has_one :guest_address, dependent: :destroy

  has_many :comments, dependent: :destroy
  has_many :affair_comments, dependent: :destroy

  #like relationshipls
  has_many :like_affairs, dependent: :destroy
  has_many :affairs, through: :like_affairs
end
