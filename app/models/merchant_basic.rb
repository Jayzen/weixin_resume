class MerchantBasic < ApplicationRecord
  mount_uploader :avatar, ImageUploader
  belongs_to :user
  has_many :merchant_basic_images, dependent: :destroy

  module Status
    On = true
    Off = false
  end

  VALID_TEL_REGEX = /\A1\d{10}\z/
  validates :name, presence: { message: "名字不能为空" }
  validates :phone, presence: { message: "手机号码不能为空" }
  validates :phone, format: { with: VALID_TEL_REGEX, message: "手机号码格式不正确" }, unless: proc{ |basic| basic.phone.blank? }
  #validates :avatar, presence: { message: "头像不能为空" }
end
