module API
  module Entities
    class AffairShare < Grape::Entity
      expose :id
      expose :guest, using: API::Entities::Guest
      expose :created_at      
    end
  end
end
