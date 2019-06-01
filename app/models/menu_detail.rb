class MenuDetail < ApplicationRecord
  mount_uploader :pic, ImageUploader
  belongs_to :user
  belongs_to :menu

  module Status
    On = true
    Off = false
  end
end
