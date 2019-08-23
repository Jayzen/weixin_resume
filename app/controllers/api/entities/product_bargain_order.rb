module API
  module Entities
    class ProductBargainOrder < Grape::Entity
      expose :id
      expose :guest, using: API::Entities::Guest
      expose :product_bargain_order_joins, using: API::Entities::ProductBargainOrderJoin
    end
  end
end
