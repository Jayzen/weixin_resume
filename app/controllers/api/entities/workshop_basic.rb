module API
  module Entities
    class WorkshopBasic < Grape::Entity
      expose :name
      expose :phone
      expose :business_hour
    end
  end
end
