module API
  module Entities
    class Affair < Grape::Entity
      expose :name
      expose :affair_images, using: API::Entities::AffairImage
    end
  end
end
