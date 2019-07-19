module API
  module Entities
    class AffairShare < Grape::Entity
      expose :id
      expose :guest, using: API::Entities::Guest
      expose :created_at      

      private
        def created_at
          created_at = object.created_at.strftime("%F %H:%M")
        end
    end
  end
end
