module API
  module Entities
    class ProductBargainDetail < Grape::Entity
      expose :id
      expose :price
      expose :product, using: API::Entities::ProductDetail
    end
  end
end
