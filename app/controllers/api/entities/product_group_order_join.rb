module API
  module Entities
    class ProductGroupOrderJoin < Grape::Entity
      expose :id
      expose :guest, using: API::Entities::Guest
    end
  end
end
