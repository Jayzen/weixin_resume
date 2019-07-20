module API
  module Entities
    class AffairComment < Grape::Entity
      expose :id
      expose :content
      expose :created_at
      expose :guest, using: API::Entities::Guest
    end
  end
end
