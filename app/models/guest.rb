class Guest < ApplicationRecord
  belongs_to :user
  
  has_many :comments, dependent: :destroy
  has_many :affair_comments, dependent: :destroy

  #like relationshipls
  has_many :like_affairs
  has_many :affairs, through: :like_affairs
end
