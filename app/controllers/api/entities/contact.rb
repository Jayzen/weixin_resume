module API
  module Entities
    class Contact < Grape::Entity
      expose :name
      expose :telephone
    end
  end
end
