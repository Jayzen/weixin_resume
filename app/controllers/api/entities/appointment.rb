module API
  module Entities
    class Appointment < Grape::Entity
      expose :name
      expose :contact
      expose :date
      expose :time
    end
  end
end
