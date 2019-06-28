class ProductSort < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy

  module Status
    On = true
    Off = false
  end 

  validates :name, presence: { message: "名称不能为空" }
end
