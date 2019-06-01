class Menu < ApplicationRecord
  mount_uploader :pic, ImageUploader
  belongs_to :user

  module Status
    On = true
    Off = false
  end
end
