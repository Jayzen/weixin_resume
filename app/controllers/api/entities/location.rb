module API
  module Entities
    class Location < Grape::Entity
      expose :name
      expose :address
      expose :latitude
      expose :longitude
    end
  end
end
