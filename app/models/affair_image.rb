class AffairImage < ApplicationRecord
  mount_uploader :pic, ImageUploader
  belongs_to :user
  belongs_to :affair

  module Status
    On = true
    Off = false
  end
 
  #default_scope { order(order: :desc).where(reveal: true) }

  validates :name, presence: { message: "标题不能为空" }
  validates :pic, presence: { message: "照片不能为空" }
end
