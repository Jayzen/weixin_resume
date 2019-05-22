class Appointment < ApplicationRecord
  belongs_to :user

  validates :name, presence: { message: "名称不能为空" }
  validates :contact, presence: { message: "联系方式不能为空" } 
  validates :content, presence: { message: "内容不能为空" }
end
