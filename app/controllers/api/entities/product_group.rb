module API
  module Entities
    class ProductGroup < Grape::Entity
      expose :id
      expose :price
      expose :product, using: API::Entities::Product
    end
  end
end
