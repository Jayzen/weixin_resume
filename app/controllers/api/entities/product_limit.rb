module API
  module Entities
    class ProductLimit < Grape::Entity
      expose :id
      expose :limit
      expose :product, using: API::Entities::Product
    
      def limit
        limit = object.limit.strftime("%F %H:%M")
      end
    end
  end
end
