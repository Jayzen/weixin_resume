module API
  module Entities
    class Address < Grape::Entity
      expose :name
      expose :mobile
      expose :province
      expose :city
      expose :country
      expose :detail
    end
  end
end
