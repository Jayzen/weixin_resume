class TapSort < ApplicationRecord
  mount_uploader :pic, ImageUploader
  belongs_to :user
  belongs_to :tap_carousel
  has_one :tap_photograph
  #has_many :tap_carousel_photographs

  module Status
    On = true
    Off = false
  end 

  validates :name, presence: { message: "标题不能为空" }
  validates :pic, presence: { message: "照片不能为空" }
end
