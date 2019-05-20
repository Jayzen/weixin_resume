class Location < ApplicationRecord
  belongs_to :user

  validates :name, presence: { message: "名称不能为空" }
  validates :address, presence: { message: "详细地址不能为空" }
  validates :longitude, presence: { message: "经度不能为空" }
  validates :latitude, presence: { message: "纬度不能为空" }
  validates :longitude, numericality: { message: "经度必须为数字" }, unless: Proc.new { |a| a.longitude.blank? }
  validates :latitude, numericality: { message: "纬度必须为数字" }, unless: Proc.new { |a| a.latitude.blank? }
end
