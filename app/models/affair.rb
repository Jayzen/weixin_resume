class Affair < ApplicationRecord
  belongs_to :user
  has_many :affair_images, dependent: :destroy
  has_many :affair_comments, dependent: :destroy

  module Status
    On = true
    Off = false
  end

  validates :name, presence: { message: "名称不能为空" }
end
