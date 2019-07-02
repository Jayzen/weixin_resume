module API
  module Entities
    class Keyword < Grape::Entity
      expose :id
      expose :name
    end
  end
end
