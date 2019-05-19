class Basic < ApplicationRecord
  mount_uploader :avatar, ImageUploader
  belongs_to :user

  module Status
    On = true
    Off = false
  end
end
