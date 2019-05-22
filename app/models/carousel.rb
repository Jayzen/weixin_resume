class Carousel < ApplicationRecord
  mount_uploader :pic, ImageUploader
  belongs_to :user
end
