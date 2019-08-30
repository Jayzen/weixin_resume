module API
  module Entities
    class Guest < Grape::Entity
      expose :id
      expose :nickname
      expose :avatar
      expose :gender
      expose :recharge
      expose :password
    end
  end
end
