module API
  module Entities
    class Error < Grape::Entity
      expose :code
      expose :message
    end
  end
end
