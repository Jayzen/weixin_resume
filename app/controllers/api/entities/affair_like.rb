module API
  module Entities
    class AffairLike < Grape::Entity
      expose :id
      expose :created_at
      expose :guest, using: API::Entities::Guest
    
      private
        def created_at
          created_at = object.created_at.strftime("%F %H:%M")
        end 
    end
  end
end
