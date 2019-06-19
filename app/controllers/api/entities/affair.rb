module API
  module Entities
    class Affair < Grape::Entity
      expose :id
      expose :name
      expose :updated_at
      expose :affair_images, using: API::Entities::AffairImage
    
      private
        def updated_at
          updated_at = object.updated_at.strftime("%F %H:%M")
        end
    end
  end
end
