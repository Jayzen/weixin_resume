class Menu < ApplicationRecord
  mount_uploader :pic, ImageUploader
  has_many :menu_details
  belongs_to :user

  module Status
    On = true
    Off = false
  end
end
