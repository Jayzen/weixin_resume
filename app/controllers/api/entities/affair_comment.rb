module API
  module Entities
    class AffairComment < Grape::Entity
      expose :content
      expose :guest, using: API::Entities::Guest
    end
  end
end
