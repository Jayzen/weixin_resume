module API
  module Entities
    class AffairLike < Grape::Entity
      expose :id
      expose :created_at
      expose :guest, using: API::Entities::Guest
    end
  end
end
