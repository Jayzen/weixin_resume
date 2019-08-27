module API
  module Entities
    class ProductRecommend < Grape::Entity
      expose :id
      expose :product, using: API::Entities::Product
    end
  end
end
