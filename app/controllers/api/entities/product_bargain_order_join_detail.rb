module API
  module Entities
    class ProductBargainOrderJoinDetail < Grape::Entity
      expose :id
      expose :product_bargain_order, using: API::Entities::ProductBargainOrderDetail
    end
  end
end
