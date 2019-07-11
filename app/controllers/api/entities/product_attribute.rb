module API
  module Entities
    class ProductAttribute < Grape::Entity
      expose :name
      expose :content
    end
  end
end
