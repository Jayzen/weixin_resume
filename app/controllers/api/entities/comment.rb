module API
  module Entities
    class Comment < Grape::Entity
      expose :content
      expose :guest, using: API::Entities::Guest
    end
  end
end
