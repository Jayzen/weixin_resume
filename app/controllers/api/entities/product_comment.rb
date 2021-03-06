module API
  module Entities
    class ProductComment < Grape::Entity
      expose :id
      expose :content
      expose :created_at
      expose :guest, using: API::Entities::Guest
    
      private
        def created_at
          created_at = object.created_at.strftime("%F %H:%M")
        end
    end
  end
end
