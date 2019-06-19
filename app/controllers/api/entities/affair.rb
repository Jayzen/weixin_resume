module API
  module Entities
    class Affair < Grape::Entity
      expose :id
      expose :name
      expose :updated_at
      expose :affair_images, using: API::Entities::AffairImage
    end
  end
end
