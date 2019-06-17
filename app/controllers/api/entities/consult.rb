module API
  module Entities
    class Consult < Grape::Entity
      expose :name
      expose :contact
    end
  end
end
