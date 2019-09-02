module API
  module Entities
    class ProductBargainOrderDetail < Grape::Entity
      expose :id
      expose :created_at
      expose :product_bargain, using: API::Entities::ProductBargainSponsor
    
      def created_at
        created_at = object.created_at.strftime("%F %H:%M")
      end 
    end
  end
end
