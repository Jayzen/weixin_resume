module API
  module Entities
    class ProductSort < Grape::Entity
      expose :id
      expose :name
    end
  end
end
