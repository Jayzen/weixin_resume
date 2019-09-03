module API
  module Entities
    class ProductBargainOrderJoinDetail < Grape::Entity
      expose :id
      expose :created_at
      expose :product_bargain_order, using: API::Entities::ProductBargainOrderDetail

      def created_at
        created_at = object.created_at.strftime("%F %H:%M")
      end
    end
  end
end
