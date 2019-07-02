class HotWord < ApplicationRecord
  belongs_to :user

  module Status
    On = true
    Off = false
  end

  validates :name, presence: { message: "名称不能为空" }
end
