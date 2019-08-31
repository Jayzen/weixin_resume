class RechargeResume < ApplicationRecord
  #from默认为0 0表示到店支付 1表示订单支付
  belongs_to :guest
end
