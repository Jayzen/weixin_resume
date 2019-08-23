module API
  module Entities
    class ProductGroupOrder < Grape::Entity
      expose :id
      expose :product_group_order_joins_count
      expose :guest, using: API::Entities::Guest
      expose :product_group_order_joins, using: API::Entities::ProductGroupOrderJoin
    end
  end
end
