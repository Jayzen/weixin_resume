class WorkshopBasic < ApplicationRecord
  belongs_to :user

  VALID_TEL_REGEX = /\A1\d{10}\z/
  validates :name, presence: { message: "名字不能为空" }
  validates :phone, presence: { message: "手机号码不能为空" }
  validates :phone, format: { with: VALID_TEL_REGEX, message: "手机号码格式不正确" }, unless: proc{ |basic| basic.phone.blank? }
  validates :business_hour, presence: { message: "营业时间不能为空" }
end
