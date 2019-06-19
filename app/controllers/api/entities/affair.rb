module API
  module Entities
    class Affair < Grape::Entity
      expose :id
      expose :name
      expose :affair_images, using: API::Entities::AffairImage
    end
  end
end
