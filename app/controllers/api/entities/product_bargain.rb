module API
  module Entities
    class ProductBargain < Grape::Entity
      expose :id
      expose :price
      expose :product, using: API::Entities::Product
    end
  end
end
