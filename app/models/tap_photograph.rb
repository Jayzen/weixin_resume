class TapPhotograph < ApplicationRecord
  mount_uploader :pic, ImageUploader

  belongs_to :user
  belongs_to :tap_carousel
  has_many :tap_photograph_images, dependent: :destroy
  has_one :home_photograph, dependent: :destroy
  has_one :state, dependent: :destroy

  module Status
    On = true
    Off = false
  end 

  validates :name, presence: { message: "标题不能为空" }
  validates :pic, presence: { message: "照片不能为空" }
end
