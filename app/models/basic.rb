class Basic < ApplicationRecord
  mount_uploader :avatar, ImageUploader
  belongs_to :user

  validates :name, presence: { message: "名称不能为空" }
end
