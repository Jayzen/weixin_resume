class Photograph < ApplicationRecord
  mount_uploader :big_pic, ImageUploader
  mount_uploader :small_pic, ImageUploader
  belongs_to :user
  has_one :recent

  module Status
    On = true
    Off = false
  end
end
