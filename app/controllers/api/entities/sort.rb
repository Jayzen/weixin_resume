module API
  module Entities
    class Sort < Grape::Entity
      expose :id
      expose :name
    end
  end
end
