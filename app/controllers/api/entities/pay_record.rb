module API
  module Entities
    class PayRecord < Grape::Entity
      expose :id
      expose :price
      expose :remark
      expose :pattern
      expose :created_at

      private
        def created_at
          created_at = object.created_at.strftime("%F %H:%M")
        end 
    end
  end
end
