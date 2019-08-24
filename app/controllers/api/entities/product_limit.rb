module API
  module Entities
    class ProductLimit < Grape::Entity
      expose :id
      expose :limit
      expose :product, using: API::Entities::Product
    
      def limit
        limit = object.limit.to_i - Time.now.to_i
      end
    end
  end
end
