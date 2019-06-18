class HomePhotographCategory < ApplicationRecord
  mount_uploader :pic, ImageUploader
  belongs_to :user
  belongs_to :photograph

  module Status
    On = true
    Off = false
  end

  validates :name, presence: { message: "标题不能为空" }
  validates :pic, presence: { message: "照片不能为空" }
  validates :photograph_id, presence: { message: "必须关联摄影作品" }
end
