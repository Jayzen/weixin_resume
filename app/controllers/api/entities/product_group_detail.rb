module API
  module Entities
    class ProductGroupDetail < Grape::Entity
      expose :id
      expose :price
      expose :product, using: API::Entities::ProductDetail
      expose :product_group_orders, using: API::Entities::ProductGroupOrder
    end
  end
end
