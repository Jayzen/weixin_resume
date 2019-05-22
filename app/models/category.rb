class Category < ApplicationRecord
  mount_uploader :big_pic, ImageUploader
  mount_uploader :small_pic, ImageUploader
  belongs_to :user
end
