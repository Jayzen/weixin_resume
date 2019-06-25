class TapPhotograph < ApplicationRecord
  belongs_to :user
  belongs_to :tap_sort
  has_many :tap_photograph_images, dependent: :destroy
  has_one :home_photograph, dependent: :destroy
  has_one :state, dependent: :destroy

  module Status
    On = true
    Off = false
  end 

  validates :name, presence: { message: "标题不能为空" }
end
