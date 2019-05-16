module API
  module Entities
    class Guest < Grape::Entity
      expose :nickname
      expose :avatar
    end
  end
end
