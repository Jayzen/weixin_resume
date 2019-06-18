class Photograph < ApplicationRecord
  mount_uploader :big_pic, ImageUploader
  mount_uploader :small_pic, ImageUploader
  belongs_to :user
  has_one :recent
  has_one :home_photograph_category
  has_one :carousel

  module Status
    On = true
    Off = false
  end
end
