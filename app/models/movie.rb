class Movie < ApplicationRecord
  mount_uploader :movie, ImageUploader
  belongs_to :user

  module Status
    On = true
    Off = false
  end
end
