class TapCarouselDetail < ApplicationRecord
  mount_uploader :pic, ImageUploader
  belongs_to :user
  belongs_to :tap_carousel_photograph

  module Status
    On = true
    Off = false
  end
end
