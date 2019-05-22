class Basic < ApplicationRecord
  mount_uploader :avatar, ImageUploader
  belongs_to :user

  module Status
    On = true
    Off = false
  end
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_TEL_REGEX = /\A1\d{10}\z/
  VALID_QQ_REGEX = /\A\d+\z/
  VALID_WECHAT_REGEX = /\A\w+\z/i

  validates :name, presence: { message: "名字不能为空" }
  validates :motto, presence: { message: "格言不能为空" }
  validates :introduction, presence: { message: "个人介绍不能为空" }
  validates :phone, presence: { message: "手机号码不能为空" }
  validates :wechat, presence: { message: "微信号码不能为空" }
  validates :qq, presence: { message: "qq号码不能为空" }
  validates :email, presence: { message: "邮箱不能为空" }
  validates :company, presence: { message: "公司名称不能为空" }
  validates :address, presence: { message: "公司地址不能为空" }
  validates :job, presence: { message: "工作内容不能为空" }
  #validates :avatar, presence: { message: "头像不能为空" }
  validates :email, format: { with: VALID_EMAIL_REGEX, message: "邮件格式不正确" }, unless: proc{ |basic| basic.email.blank? }
  validates :phone, format: { with: VALID_TEL_REGEX, message: "手机号码格式不正确" }, unless: proc{ |basic| basic.phone.blank? }
  validates :qq, format: { with: VALID_QQ_REGEX, message: "qq号码格式不正确" }, unless: proc{ |basic| basic.qq.blank? }
  validates :wechat, format: { with: VALID_WECHAT_REGEX, message: "微信号码格式不正确" }, unless: proc{ |basic| basic.wechat.blank? }
end
