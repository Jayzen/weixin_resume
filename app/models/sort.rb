class Sort < ApplicationRecord
  belongs_to :user
  has_many :product_sorts, dependent: :destroy
  has_many :products, through: :product_sorts

  module Status
    On = true
    Off = false
  end 

  validates :name, presence: { message: "名称不能为空" }
end
