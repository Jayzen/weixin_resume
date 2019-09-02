module API
  module Entities
    class ProductBargainSponsor < Grape::Entity
      expose :id
      expose :price
      expose :product, using: API::Entities::Product
    end
  end
end
