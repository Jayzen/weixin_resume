module API
  module Entities
    class OrderProduct < Grape::Entity
      expose :id
      expose :count
      expose :product, using: API::Entities::Product
    end
  end
end
