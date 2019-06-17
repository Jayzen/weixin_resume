module API
  module Entities
    class Consult < Grape::Entity
      expose :name
      expose :contact
      expose :content
    end
  end
end
