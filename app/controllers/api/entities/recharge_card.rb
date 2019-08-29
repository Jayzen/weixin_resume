module API
  module Entities
    class RechargeCard < Grape::Entity
      expose :id
      expose :name
      expose :recharge
      expose :benefit
    end
  end
end
