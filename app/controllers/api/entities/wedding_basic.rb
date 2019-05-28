module API
  module Entities
    class WeddingBasic < Grape::Entity
      expose :name
      expose :phone
    end
  end
end
