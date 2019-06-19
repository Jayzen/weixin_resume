module API
  module Entities
    class User < Grape::Entity
      expose :wedding_basic, using: API::Entities::WeddingBasic
    end
  end
end
