class RechargeRecord < ApplicationRecord
  #from默认为0 0表示充值卡充值  1表示直接充值
  belongs_to :guest
end
