module API
  module Entities
    class RechargeResume < Grape::Entity
      expose :id
      expose :from
      expose :recharge
      expose :created_at  
  
      private
        def created_at
          created_at = object.created_at.strftime("%F %H:%M")
        end
    end
  end
end
