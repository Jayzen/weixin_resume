class Consult < ApplicationRecord
  belongs_to :user
  VALID_TEL_REGEX = /\A1\d{10}\z/

  validates :name, presence: { message: "姓名不能为空" }
  validates :contact, presence: { message: "手机号码不能为空" }
  validates :content, presence: { message: "咨询内容不能为空" }
  validates :contact, format: { with: VALID_TEL_REGEX, message: "手机号码格式不正确" }, unless: proc{ |consult| consult.contact.blank? }
end
