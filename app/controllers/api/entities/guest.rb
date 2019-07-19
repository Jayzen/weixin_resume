module API
  module Entities
    class Guest < Grape::Entity
      expose :nickname
      expose :avatar
      expose :gender
    end
  end
end
