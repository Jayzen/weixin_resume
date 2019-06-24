class TapPhotograph < ApplicationRecord
  belongs_to :user
  belongs_to :tap_sort
  has_many :tap_photograph_images, dependent: :destroy

  module Status
    On = true
    Off = false
  end 

  validates :name, presence: { message: "标题不能为空" }
end
