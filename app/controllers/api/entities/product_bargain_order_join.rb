module API
  module Entities
    class ProductBargainOrderJoin < Grape::Entity
      expose :id
      expose :guest, using: API::Entities::Guest
    end
  end
end
