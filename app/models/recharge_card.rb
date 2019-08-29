class RechargeCard < ApplicationRecord
  belongs_to :user

  validates :recharge, presence: { message: "面额值不能为空" }
  validates :benefit, presence: { message: "赠送值不能为空" }

  module Status
    On = true
    Off = false
  end
end
