class Menu < ApplicationRecord
  mount_uploader :pic, ImageUploader
  has_many :menu_details
  belongs_to :user

  module Status
    On = true
    Off = false
  end
  
  validates :title, presence: { message: "标题不能为空" }
  validates :pic, presence: { message: "照片不能为空" }
  validates :price, presence: { message: "价格不能为空" }
end
