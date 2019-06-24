module API
  module Entities
    class TapPhotograph < Grape::Entity
      expose :name
      expose :id
      expose :tap_photograph_images, using: API::Entities::TapPhotographImage
    end
  end
end
